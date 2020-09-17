require 'uri'
require 'pathname'
require 'fileutils'

module Storage
  class LocalDiskStrategy
    def initialize(target_directory:, image_url:, content:)
      @target_directory = Pathname.new(target_directory)
      @filename = @target_directory.join(File.basename(URI(image_url).path))
      @content = content

      dirname = File.dirname(@filename)
      FileUtils.mkdir_p(dirname) unless File.directory?(dirname)
    end

    def store
      File.write(@filename, @content)
      puts "Stored #{@filename}"
      nil
    end
  end
end
