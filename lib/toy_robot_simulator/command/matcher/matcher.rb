module Command
  module Matcher
    def self.parse(string)
      all.each do |matcher|
        command = matcher.build_with_match(string)
        return command if command
      end
      nil
    end

    def self.all
      constants(false).reject! { |const| const == :Base }.map { |const| const_get(const) }
    end
  end
end
