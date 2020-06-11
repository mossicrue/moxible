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
      self.exitWith "#{string} is not implemented yet"
    end

    def self.putsError(string)
      STDERR.puts "FATAL ERROR: #{string}"
    end
  end
end
