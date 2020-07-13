module MoxibleOptionParser
  class Binding

    @@parsedOptions = {}

    ## MARK: Subcommand Options Tree
    SUBCOMMAND_TREE = {
      # global settings, I mean, first help when you type ./moxible --help
      Moxible::Constants::CMD_GLOBAL => OptionParser.new do |opts|
        opts.banner = "Usage:\n    #{opts.program_name} SUBCOMMANDS [ARG] ..."
        opts.separator ""
        opts.separator <<HELP
Parameters:
SUBCOMMAND                     Subcommand
[ARG] ...                      Subcommand arguments

Subcommand:
  run                          Run a #{Moxible::Constants::PROGRAM_NAME} quest
  config                       Edit #{Moxible::Constants::PROGRAM_NAME} configuration
  inventory                    Manipulate #{Moxible::Constants::PROGRAM_NAME} inventory
  version                      Show #{Moxible::Constants::PROGRAM_NAME} version

See '#{Moxible::Constants::PROGRAM_NAME} [SUBCOMMANDS] --help' for more information on a specific command.
HELP
      end,

      #TODO: Finish the Moxible::OptionsParser::Binding class with at least the 3 major subcommand to be listed with basic command for start test
      # -q, --quest   -->  filepath to quest file
      # -p, --party   -->  filepath to a party file, list of servers
      # -t, --target  -->  server, list of servers
      # -u, --user    -->  global user to launch quests
      Moxible::Constants::CMD_RUN => OptionParser.new do |opts|
        opts.banner = "Usage:\n    #{opts.program_name} #{Moxible::Constants::CMD_RUN} [options] SUBCOMMANDS [ARG] ..."
        opts.separator ""
        opts.separator <<HELP
Parameters:
SUBCOMMAND                     Subcommand
[ARG] ...                      Subcommand arguments

Subcommand:

HELP
      end,

      Moxible::Constants::CMD_CONFIG => OptionParser.new do |opts|
        opts.banner = "Usage:\n    #{opts.program_name} #{Moxible::Constants::CMD_CONFIG} [options] SUBCOMMANDS [ARG] ..."
        opts.separator ""
        opts.separator <<HELP

HELP
      end,

      Moxible::Constants::CMD_INVENTORY => OptionParser.new do |opts|
        opts.banner = "Usage:\n    #{opts.program_name} #{Moxible::Constants::CMD_INVENTORY} [options] SUBCOMMANDS [ARG] ..."
        opts.separator ""
        opts.separator <<HELP

HELP
      end,
      # maybe an optparse for version command isn't necessary but at least is line of code :D
      Moxible::Constants::CMD_VERSION => OptionParser.new do |opts|
        opts.banner = "Usage:\n    #{opts.program_name} #{Moxible::Constants::CMD_VERSION} [options] SUBCOMMANDS [ARG] ..."
        opts.separator ""
        opts.separator <<HELP

HELP
      end
    }

    def self.getOptionParser(command)
      if not SUBCOMMAND_TREE.has_key? command
        Moxible::Utils::exitWithError "SUBCOMMAND #{command} not expected. Exiting", Moxible::Constants::EXIT_INVALID_SUBCOMMAND
      end
      return SUBCOMMAND_TREE[command]
    end

    def self.getParsedOptions()
      return @@parsedOptions
    end

  end
end
