require "sass"

module CSSBuilder

    class Compiler

        @output_style = Sass::OutputStyle::COMPRESSED

        getter output_style : Sass::OutputStyle

        def initialize(@source_dirs : Array(String), @dest_dir : String, output_style : Sass::OutputStyle | Nil = nil)
            @output_style = output_style if output_style
        end

        def compile
            @source_dirs.each { |source_dir| compile_dir(source_dir) }
        end

        private def compile_dir(source_dir : String)
            if !Dir.exists?(source_dir)
                puts "Skipping compilation for directory #{source_dir} because is does not exist."
                return
            end

            Dir.cd(source_dir) do
                files = Dir.glob(["*.sass", "*.scss"])
                files.each do |source_file|
                    dest_filename = "#{File.basename(source_file, File.extname(source_file))}.css"
                    dest_file = Path.new(@dest_dir, dest_filename)
                    puts "Compiling #{File.expand_path(source_file)} => #{dest_file} using #{output_style.to_s.downcase} style."
                    File.open(dest_file, "w") do |f|
                        f.write(Sass.compile_file(source_file, output_style: output_style).to_slice)
                    end
                end
            end
        end
    end

end