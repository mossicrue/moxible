module Moxible
  class Constants
    # general purpose constants of the moxible tools
    PROGRAM_NAME = "Moxible".freeze
    PROGRAM_VERSION = "0.0.1 pre-alpha"

    # commands and subcommands of the moxible tools
    CMD_GLOBAL = "global"
    CMD_RUN = "run"
    CMD_CONFIG = "config"
    CMD_PARTY = "party"
    CMD_VERSION = "version"

    # options of the moxible tools
    QUEST_FILE = :quest_file
    PARTY_FILE = :party_file
    GLOBAL_USER = :global_user

    # exit code of moxible
    EXIT_ZERO = 0
    EXIT_INVALID_PARSE = 10
    EXIT_INVALID_SUBCOMMAND = 11
  end
end
