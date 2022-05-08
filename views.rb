module Views

  module Headers

    def self.welcome_header
      "\n             _     _                    ____              _\n"\
      "    /\\      | |   | |                  |  _ \\            | |\n"\
      "   /  \\   __| | __| |_ __ ___ ___ ___  | |_) | ___   ___ | | __\n"\
      "  / /\\ \\ / _` |/ _` | '__/ _ \\ __/ __| |  _ < / _ \\ / _ \\| |/ /\n"\
      " / ____ \\ (_| | (_| | | |  __\\__ \\__ \\ | |_) | (_) | (_) |   <\n"\
      "/_/    \\_\\__,_|\\__,_|_|  \\___|___/___/ |____/ \\___/ \\___/|_|\\_\\\n\n".colorize(:green)
    end

    def self.error_header
      " ______\n"\
      "|  ____|\n"\
      "| |__   _ __ _ __ ___  _ __\n"\
      "|  __| | '__| '__/ _ \\| '__|\n"\
      "| |____| |  | | | (_) | |\n"\
      "|______|_|  |_|  \\___/|_| \n\n".colorize(:red)

    end

    def self.exit_header
      " ____               ____             _\n"\
       "|  _ \\             |  _ \\           | |\n" \
       "| |_) |_   _  ___  | |_) |_   _  ___| |\n"\
       "|  _ <| | | |/ _ \\ |  _ <| | | |/ _ \\ |\n"\
       "| |_) | |_| |  __/ | |_) | |_| |  __/_|\n"\
       "|____/ \\__, |\\___| |____/ \\__, |\\___(_)\n"\
       "        __/ |              __/ |\n"\
       "       |___/              |___/\n\n".colorize(:green)
    end
  end

  module Contacts

    def self.summary(contact)
      "\nSUMMARY\n".colorize(:yellow) +
        "-------\n" \
      "Name: ".colorize(:blue) +
        "#{contact.first_name} #{contact.last_name}\n".colorize(:yellow) +
        "Phone: ".colorize(:blue) +
        "#{contact.phone}\n".colorize(:yellow)
    end

    def self.render_all(contacts)
      if contacts.length == 0
        Screen::render_view(Views::Contacts::empty)
      end
      Screen::render_view("\n---------------------------\n".colorize(:green))
      contacts.each_with_index do |contact, index|
        Screen::render_view(
          "(#{index}) Name: #{contact.first_name} #{contact.last_name}\n"\
        "   Phone: #{contact.phone}\n".colorize(:yellow) +
            "---------------------------\n".colorize(:green)
        )
      end
    end

    def self.empty
      "\n---------------------------\n".colorize(:blue) +
        "\n** Contact list is empty **\n".colorize(:yellow) +
        "\n---------------------------\n".colorize(:blue)
    end
  end

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

  module Inputs

    def self.enter_yes_or_no(question)
      "#{question} \n".colorize(:blue) +
        "(1) Yes\n" \
        "(2) No\n\n".colorize(:yellow) +
        self.enter_option

    end

    def self.enter_option
      "Option: ".colorize(:blue)
    end

    def self.enter_data(name)
      "Please enter #{name}: ".colorize(:yellow)
    end

    def self.enter_contact_number(first_name, last_name)
      "Please enter contact number of #{first_name} #{last_name}: ".colorize(:yellow)
    end
  end

  module Errors

    def self.invalid_option
      Views::Headers::error_header +
        "Invalid option selected.\n"\
              "Please try again\n".colorize(:red)
    end

    def self.option_out_of_range
      Views::Headers::error_header +
        "Option out of range\n"\
              "Please try again\n".colorize(:red)

    end

    def self.empty_input(name)
      "#{name} should not be empty\n".colorize(:red)
    end
  end
end

module Input

  def self.get(name)
    Screen::get_input(Views::Inputs::enter_data(name))
  end

  def self.get_with_validator(name)
    Validator::take_valid_input(Views::Inputs::enter_data(name))
  end

  def self.get_phone(first_name, last_name)
    Screen::get_input(
      Views::Inputs::enter_contact_number(first_name, last_name))
  end

  def self.get_phone_with_validator(first_name, last_name)
    Validator::take_valid_phone(
      Views::Inputs::enter_contact_number(first_name, last_name))
  end

  def self.get_yes_or_no(question)
    Screen::get_input(Views::Inputs::enter_yes_or_no(question))
  end

  def self.get_within_range(start, stop)
    Validator::take_number_between(
      Views::Inputs::enter_option, start - 1, stop + 1)
  end
end
