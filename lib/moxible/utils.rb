module Moxible
  class Utils
    def self.exitWithError(string, errorCode)
      self.putsError string
      exit errorCode
    end

    def self.exitWith(string)
      puts string
      exit Moxible::Constants::EXIT_ZERO
    end

    def self.exitWithPending string
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
