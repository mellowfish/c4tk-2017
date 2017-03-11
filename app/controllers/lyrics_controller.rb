class LyricsController < ApplicationController
  def index
  end

  def raw_new
  end

  def raw_create
    SongLyric.import_from_raw_lyrics(song: song, raw_lyrics: params.require(:song).require(:raw_lyrics))
    redirect_to song_path(song)
  end

  def edit_all
  end

  def destroy_all
    song.sections.destroy_all
    redirect_to song_path(song)
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  helper_method \
  def song
    @song ||= Song.find_by_id(params[:song_id].to_i)
  end
end