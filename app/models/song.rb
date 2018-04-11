class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name
  end

  def note_contents=(content)
    arr = content.reject(&:empty?)
    arr.each do |note|
      self.notes << Note.find_or_create_by(content: note)
    end
  end

  def note_contents
    arr = self.notes.collect do |note|
      note.content
    end
  end
end
