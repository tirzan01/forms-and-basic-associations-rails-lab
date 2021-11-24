class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  attr_accessor :song_notes_1, :song_notes_2

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents
    self.notes.map{ |n| n.content }
  end

  def note_contents=(notes)
    notes.each do |n|
      self.notes << Note.new(content: n)
    end
  end

  def note_ids=(ids)
    ids.each do |id|
      note = Note.find(id)
      self.notes << note
    end
  end

end
