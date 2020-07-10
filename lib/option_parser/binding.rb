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
  party                    Manipulate #{Moxible::Constants::PROGRAM_NAME} party
  version                      Show #{Moxible::Constants::PROGRAM_NAME} version

See '#{Moxible::Constants::PROGRAM_NAME} [SUBCOMMANDS] --help' for more information on a specific command.
HELP
      end,

      #TODO: Finish the Moxible::OptionsParser::Binding class with at least the 3 major subcommand to be listed with basic command for start test
      # -q, --quest   -->  filepath to quest file
      # -p, --party   -->  filepath to a party file, list of servers
      # -u, --user    -->  global user to launch quests
      Moxible::Constants::CMD_RUN => OptionParser.new do |opts|
        opts.banner = "Usage:\n    #{opts.program_name} #{Moxible::Constants::CMD_RUN} [options] SUBCOMMANDS [ARG] ..."
        opts.separator ""
        opts.serpator <<HELP
Parameters:
SUBCOMMAND                     Subcommand
[ARG] ...                      Subcommand arguments

Subcommand:

HELP

        opts.on("-q", "--quest=QUEST_FILE", "Path of the quest file to run") do |quest|
          @@parsedOptions[Moxible::Constants::QUEST_FILE] = quest
        end

        opts.on("-p", "--party=PARTY_FILE", "Path to the party file that will run a quest") do |party|
          @@parsedOptions[Moxible::Constants::PARTY_FILE] = party
        end

        opts.on("-u", "--user=USER", "Global user that will run the quests commands on the party servers") do |user|
          @@parsedOptions[Moxible::Constants::GLOBAL_USER] = user
        end

      end,

      Moxible::Constants::CMD_CONFIG => OptionParser.new do |opts|
        opts.banner = "Usage:\n    #{opts.program_name} #{Moxible::Constants::CMD_CONFIG} [options] SUBCOMMANDS [ARG] ..."
        opts.separator ""
        opts.serpator <<HELP

HELP
      end,

      Moxible::Constants::CMD_PARTY => OptionParser.new do |opts|
        opts.banner = "Usage:\n    #{opts.program_name} #{Moxible::Constants::CMD_PARTY} [options] SUBCOMMANDS [ARG] ..."
        opts.separator ""
        opts.serpator <<HELP

HELP
      end,
      # maybe an optparse for version command isn't necessary but at least is line of code :D
      Moxible::Constants::CMD_VERSION => OptionParser.new do |opts|
        opts.banner = "Usage:\n    #{opts.program_name} #{Moxible::Constants::CMD_VERSION} [options] SUBCOMMANDS [ARG] ..."
        opts.separator ""
        opts.serpator <<HELP

HELP
      end
    }

  end
end
