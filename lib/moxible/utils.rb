module Moxible
  class Utils
    def self.exitWithError(string, error_code)
      self.putsError string
      exit error_code
    end

    def self.exitWith(string)
      puts string
      exit Moxible::Constants::EXIT_ZERO
    end

    def self.exitWithPending(string)
      self.exitWith "[WIP] #{string} is not implemented yet"
    end

    def self.putsError(string)
      STDERR.puts "FATAL ERROR: #{string}"
    end

    def self.showVersion
      self.exitWith "#{Moxible::Constants::PROGRAM_NAME} #{Moxible::Constants::PROGRAM_VERSION}"
    end
  end
end
