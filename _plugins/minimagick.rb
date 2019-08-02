require "mini_magick"
require "fileutils"

module Jekyll
  module MiniMagick
    def magick(image_path, options)
      filename, ext = image_path.split("/").last.split(".")

      dest_path = image_path.
        split("/")[0..-2].
        prepend("assets").
        join("/")

      options.each do |command, arg|
        filename += "_#{command}#{arg}"
      end

      write_path = "#{dest_path}/#{filename}.#{ext}"

      if File.exists?("_site/#{write_path}")
        return write_path
      end

      FileUtils.mkpath("_site/#{dest_path}")

      image = ::MiniMagick::Image.open("_pictures/#{image_path}")

      image.combine_options do |i|
        options.each do |command, arg|
          i.send command, arg
        end
        i.strip
      end

      image.write "_site/#{write_path}"

      write_path
    end
  end
end

Liquid::Template.register_filter(Jekyll::MiniMagick)
