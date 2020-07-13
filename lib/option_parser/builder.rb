module MoxibleOptionParser
  class Builder
    def self.initializeGlobalParser()
      return self.initializeParser Moxible::Constants::CMD_GLOBAL
    end

    def self.initializeParser(command)
      return MoxibleOptionParser::Binding::getOptionParser command
    end
  end
end
