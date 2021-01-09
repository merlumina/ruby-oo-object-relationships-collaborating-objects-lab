require "pry"

class MP3Importer
    attr_reader :path

    def initialize(path)
        @path = path
    end

    def files
        file_list = Dir.glob("#{path}/*.mp3").collect {|file| file.gsub("#{path}/", "")}
    end

    def import
        files.each {|f| Song.new_by_filename(f)}
    end

end