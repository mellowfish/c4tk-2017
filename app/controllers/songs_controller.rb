class SongsController < ApplicationController
  skip_before_action :verify_authenticity_token, if: :api_call?

  def index
    respond_to do |format|
      format.html
      format.json { render json: songs.to_a }
    end
  end

  def new
    @song = Song.new
  end

  def create
    general_references = params[:song][:general_references]
    raw_lyrics = params[:song][:raw_lyrics]
    @song = Song.create(song_params)
    if song.persisted?
      if raw_lyrics.present?
        ImportsRawLyrics.new(song: @song, raw_lyrics: raw_lyrics).call
      end

      if general_references.present?
        SongLyricVerseReference.import_raw_general_references(song: @song, general_references: general_references)
      end
      return redirect_to song_path(song)
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: song }
    end
  end

  def edit
  end

  def update
    song.update(song_params)
    return redirect_to song_path(song) if song.valid?
  end

  def destroy
    song.destroy
    redirect_to songs_path
  end

  private

  def api_call?
    params[:api_key] == "shibboleet"
  end

  def song_params
    params.required(:song).permit(:title, :artist, :video_url, :bpm, :time_signature, :release_year, :rating)
  end

  helper_method \
  def songs
    @songs ||=
      if params[:q].present?
        Song.from_search(params[:q])
      else
        Song.all
      end.page(page).per(per)

  end

  helper_method \
  def song
    @song ||= Song.find_by_id(params[:id].to_i)
  end
end