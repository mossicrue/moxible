module Moxible
  class Dispatcher
    def self.dispatch(command, options)
      case command
      # add also the other, but for now, return the version
      when Moxible::Constants::CMD_VERSION
        Moxible::Utils::showVersion
      else
        Moxible::Utils::exitWithPending "#{command}"
      end
    end
  end
end
