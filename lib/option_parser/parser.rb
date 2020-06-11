module MoxibleOptionParser
  class Parser
    def self.parse(optionParser, passedArguments)
      command = ""
      options = {}
      self.checkArguments optionParser, passedArguments
      while passedArguments.size > 0
        command = self.buildCommand command, passedArguments.shift
        subOptionParser = MoxibleOptionParser::Builder::initializeParser command
        self.parseOptions subOptionParser
        options = MoxibleOptionParser::Binding::getParsedOptions
      end
      self.checkParsedOptions options, subOptionParser
      return command, options
    end

    def self.checkArguments(optionParser, passedArguments)
      if passedArguments.size == 0
        self.printHelp optionParser
      end
    end

    def self.buildCommand(oldCommand, newCommand)
      if not oldCommand.size == 0
        oldCommand.concat "_"
      end
      return oldCommand.concat newCommand
    end

    def self.parseOptions(optionParser)
      begin
        optionParser.order!
      rescue OptionParser::ParseError => exception
        Moxible::Utils::exitWithError "#{exception}\n\n See #{MoxibleSettings::Defaults::PROGRAM_NAME} --help", Moxible::Constants::INVALID_PARSE
      end
    end

    def self.checkParsedOptions(options, optionParser)
      if options.empty?
        self.printHelp optionParser
      end
    end

    def self.printHelp(optionParser)
      # Just for testing this simple way
      Moxible::Utils::exit optionParse.help
      # puts optionParser.help
      # exit 0
    end
  end
end
