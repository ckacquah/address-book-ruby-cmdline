module Views

  module Menus

    def self.main
      Views::Headers::welcome_header +
        "\nSelect an option\n".colorize(:yellow) +
        "(1) Add contact\n"\
                "(2) Edit contact\n"\
                "(3) View contacts\n"\
                "(4) Delete contact\n\n".colorize(:red) +
        Views::Inputs::enter_option
    end

    def self.quit_home_back
      "\nSelect an option\n".colorize(:yellow) +
        "(0) Quit\n"\
        "(1) Home\n"\
                "(2) Back\n\n".colorize(:red) +
        Views::Inputs::enter_option
    end
  end

end

