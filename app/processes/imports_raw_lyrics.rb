class ImportsRawLyrics
  attr_reader :song, :raw_lyrics
  attr_reader :section, :line_number, :lines_in_section, :sections

  def initialize(song:, raw_lyrics:)
    @song = song
    @raw_lyrics = raw_lyrics.to_s.tr("\r", "")
  end

  def call
    reset
    lines.each { |line| process(line) }
  end

  def process(line)
    possible_section_boundary =
      line
        .downcase
        .gsub(/[^[:alpha:] ]/, "")
        .gsub(/repeat\w*/, "")
        .strip
    if possible_section_boundary.start_with?("chorus")
      start_chorus
    elsif possible_section_boundary.start_with?("bridge")
      start_bridge
    elsif possible_section_boundary.start_with?("intro")
      start_intro
    elsif possible_section_boundary.start_with?("verse") || possible_section_boundary.blank?
      start_verse
    elsif possible_section_boundary.start_with?("lyric") ||
      (
        line_number == 0 &&
          (
            possible_section_boundary.start_with?("capo")
          )
      )
      # noop
    else
      record_line_in_section
      create(line)
      advance_line
    end
  end

  def create(line)
    SongLyric.create!(song: song, line: line, section: section, sort_order: line_number)
  end

  private

  def reset
    @line_number = 0
    start_verse
  end

  def lines
    @lines ||= raw_lyrics.split("\n")
  end

  def record_line_in_section
    section.save! if lines_in_section == 0
  end

  def advance_line
    @line_number += 1
    @lines_in_section += 1
  end

  def start_chorus
    @lines_in_section = 0
    @section = SongSection.new(song: song, name: "Chorus")
  end

  def start_bridge
    @lines_in_section = 0
    @section = SongSection.new(song: song, name: "Bridge")
  end

  def start_intro
    @lines_in_section = 0
    @section = SongSection.new(song: song, name: "Intro")
  end

  def start_verse
    @lines_in_section = 0
    @section = SongSection.new(song: song, name: "Verse")
  end
end