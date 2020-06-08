module MoxibleOptionParser
  class Binding

    @@parsedOptions = {}

    ## MARK: Subcommand Options Tree
    SUBCOMMAND_TREE = {
      # global settings, I mean, first help when you type ./moxible --help
      Moxible::Constants::GLOBAL => OptionParser.new do |opts|
        opts.banner = "Usage:\n    #{opts.program_name} [options] SUBCOMMANDS [ARG] ..."
        opts.separator ""
        opts.separator <<HELP
Parameters:
SUBCOMMAND                     Subcommand
[ARG] ...                      Subcommand arguments

Subcommand:
  run                          Run a Moxible quest
  config                       Edit Moxible configuration
  inventory                    Manipulate Moxible inventory
HELP
      end,

      #TODO: Finish the Moxible::OptionsParser::Binding class with at least the 3 major subcommand to be listed with basic command for start test
      Moxible::Constants::RUN => OptionParser.new do |opts|

      end,

      Moxible::Constants::CONFIG => OptionParser.new do |opts|

      end,

      Moxible::Constants::INVENTORY => OptionParser.new do |opts|

      end
    }

  end
end
