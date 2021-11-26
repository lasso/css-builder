require "sass"

module CSSBuilder

    class StringHelper

        def self.parse_output_format(input : String) : Sass::OutputStyle
            case input.downcase
            when "nested" then return Sass::OutputStyle::NESTED
            when "expanded" then return Sass::OutputStyle::EXPANDED
            when "compact" then return Sass::OutputStyle::COMPACT
            when "compressed" then return Sass::OutputStyle::COMPRESSED
            else raise ArgumentError.new("Unhandled output format '#{input}'")
            end
        end
    end

end