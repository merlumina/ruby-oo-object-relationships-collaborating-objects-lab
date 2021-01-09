require "pry"

class Song
    attr_accessor :name, :artist, :genre

    @@all = []

    def initialize(name)
        self.name = name
        save
    end

    def self.all
        @@all
    end

    def save
        self.class.all << self
    end

    def self.new_by_filename(filename)
        # binding.pry
        artist, song = filename.gsub(".mp3", "").split(" - ")
        new_song = self.new(song)
        new_song.artist_name = artist
        new_song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end

end