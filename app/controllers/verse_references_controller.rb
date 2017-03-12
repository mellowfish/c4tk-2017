class VerseReferencesController < ApplicationController
  def new
    @verse_reference ||= SongLyricVerseReference.new(song: song)
  end

  def create
    @verse_reference ||= SongLyricVerseReference.create(song: song, **verse_reference_params)
    redirect_to(song_path(song, anchor: "verses"))
  end

  def destroy
    SongLyricVerseReference.find_by_id(params[:id]).destroy!
    redirect_to song_path(song, anchor: "verses")
  end

  def destroy_general
    SongLyricVerseReference.where(song: song, section: nil, lyric: nil).destroy_all
    redirect_to song_path(song, anchor: "verses")
  end

  private

  def verse_reference_params
    params
      .require(:song_lyric_verse_reference)
      .permit(
        :song_id, :song_section_id, :song_lyric_id,
        :verse_range_str,
        :start_book, :start_book_name, :start_chapter, :start_verse, :start_verse_reference,
        :end_book, :end_book_name, :end_chapter, :end_verse, :end_verse_reference
      )
      .symbolize_keys
  end

  helper_method \
  def verse_reference
    @verse_reference ||= SongLyricVerseReference.find_by_id(params[:id])
  end

  helper_method \
  def song
    @song ||= Song.find_by_id(params[:song_id].to_i)
  end
end