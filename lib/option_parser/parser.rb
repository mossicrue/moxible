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
      # I need to think if this functions can be usefull here or moved in every dispatched functions,
      # for now I think that the function will be commented also for a easy developing
      # self.checkParsedOptions options, subOptionParser
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
        Moxible::Utils::exitWithError "#{exception}\n\n See #{MoxibleSettings::Constants::PROGRAM_NAME} --help", Moxible::Constants::INVALID_PARSE
      end
    end

    # I need to think if this functions can be usefull here or moved in every dispatched functions,
    # for now I think that the function will be commented also for a easy developing
    # def self.checkParsedOptions(options, optionParser)
    #   if options.empty?
    #     self.printHelp optionParser
    #   end
    # end

    def self.printHelp(optionParser)
      Moxible::Utils::exitWith optionParser.help
    end
  end
end
