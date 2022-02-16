class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_title)
    song = self.new
    song.name = song_title

    # song.save

    # (test doesn't require saving to array)
    song
  end

  def self.create_by_name(song_title)
    song = self.new
    song.name = song_title
    song.save
    song
  end

  def self.find_by_name(song_title)
    self.all.find { |song| song.name == song_title }
    #  self.all.find do |song|
    #   song.name == song_title
    #   p "#{song_title} exists!"
    # end
  end

  def self.find_or_create_by_name(song_title)
    self.find_by_name(song_title) || self.create_by_name(song_title)
    #   if self.all.include?(song_title)
    #     self.find_by_name(song_title)
    #   else
    #     self.create_by_name(song_title)
    #   end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(file)
    splitArray = file.split(' - ')
    artist_name = splitArray[0]
    song_name = splitArray[1].gsub('.mp3', '')

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file)
    splitArray = file.split(' - ')
    artist_name = splitArray[0]
    song_name = splitArray[1].gsub('.mp3', '')

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end
end

#this song isn't saved in the class variable array @@all
song2 = Song.new_by_name('Immediately Forgotten Song')

song = Song.create_by_name('Immigrant Song')
song = Song.create_by_name('Black Dog')
song = Song.create_by_name("Since I've been Loving You")

p song2
p Song.all

p Song.find_by_name('Immigrant Song')
#return falsey value "nil" as Othello doesn't exist
p Song.find_by_name('Othello')
