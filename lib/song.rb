
class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        parsed_filename = filename.split(" - ")
        song = self.new(parsed_filename[1])
        song.artist_name = parsed_filename[0]
        song
    end

    def artist_name=(name)
        Artist.find(name) ? self.artist = Artist.find(name) : self.artist = Artist.new(name)
    end 

end