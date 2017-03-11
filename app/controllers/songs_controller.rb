class SongsController < ApplicationController
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
    @song = Song.create(song_params)
    return redirect_to song_path(song) if song.persisted?
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
  end

  private

  def song_params
    params.required(:song).permit(:title, :artist, :video_url, :bpm, :time_signature, :release_year, :rating)
  end

  helper_method \
  def songs
    # TODO: add search here
    @songs ||= Song.page(page).per(per)
  end

  helper_method \
  def song
    @song ||= Song.find_by_id(params[:id].to_i)
  end
end