module CSSBuilder

    class FileHelper

        def self.abspath(dir : String)
            path = Path.new(dir)
            return path.normalize.to_s if path.absolute?
            path.expand.to_s
        end

    end

end