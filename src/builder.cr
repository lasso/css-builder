require "option_parser"
require "sass"
require "./builder/compiler"
require "./builder/file_helper"
require "./builder/string_helper"

module CSSBuilder

    source_dirs = [] of String
    dest_dir : String | Nil = nil
    output_format : Sass::OutputStyle | Nil = nil

    OptionParser.parse do |parser|
        parser.banner = "CSS Builder"

        parser.on "-s dir", "--source=dir", "Source directory" do |dir|
            source_dirs << FileHelper.abspath(dir)
        end
        parser.on "-d dir", "--destination=dir", "Destination directory" do |dir|
            unless dest_dir.nil?
                puts "Only one destination directory is allowed!"
                puts parser
                exit
            end
            dest_dir = FileHelper.abspath(dir)
        end
        parser.on "-f format", "--format=format", "Output format" do |format|
            begin
                output_format = StringHelper.parse_output_format(format)
            rescue err : ArgumentError
                puts err.message
                puts parser
                exit
            end
        end
        parser.on "-h", "--help", "Show help" do
            puts parser
            exit
        end
    end

    unless dest_dir
        puts "No destination directory provided"
        exit
    end

    CSSBuilder::Compiler.new(source_dirs, dest_dir.as(String), output_format).compile
end