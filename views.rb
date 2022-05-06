require 'colorize'

module Views

  module Headers

    def self.welcome_header
      return "\n             _     _                    ____              _\n"\
           "    /\\      | |   | |                  |  _ \\            | |\n"\
           "   /  \\   __| | __| |_ __ ___ ___ ___  | |_) | ___   ___ | | __\n"\
           "  / /\\ \\ / _` |/ _` | '__/ _ \\ __/ __| |  _ < / _ \\ / _ \\| |/ /\n"\
           " / ____ \\ (_| | (_| | | |  __\\__ \\__ \\ | |_) | (_) | (_) |   <\n"\
           "/_/    \\_\\__,_|\\__,_|_|  \\___|___/___/ |____/ \\___/ \\___/|_|\\_\\\n\n".colorize(:green)
    end

    def self.error_header
      return " ______\n"\
            "|  ____|\n"\
            "| |__   _ __ _ __ ___  _ __\n"\
            "|  __| | '__| '__/ _ \\| '__|\n"\
            "| |____| |  | | | (_) | |\n"\
            "|______|_|  |_|  \\___/|_| \n\n".colorize(:red)

    end
  end

  module Contacts
    def self.summary(contact, index = nil)
      if index == nil
        return "Name: ".colorize(:blue) +
          "#{contact.first_name} #{contact.last_name}\n".colorize(:yellow) +
          "Phone Number: #{contact.phone}"
      else
        return "(#{index}) Name: #{contact.first_name} #{contact.last_name}\n"\
                "   Phone Number: #{contact.phone}".colorize(:yellow)
      end
    end

    def self.render_all(contacts)
      puts "\n---------------------".colorize(:green)
      contacts.each_with_index do |contact, index|
        Screen::render_view(Views::Contacts::summary(contact, index))
        puts "\n---------------------".colorize(:green)
      end
    end

    def self.empty
      return "\n---------------------------\n".colorize(:blue) +
        "\n** Contact list is empty **\n".colorize(:yellow) +
        "\n---------------------------\n".colorize(:blue)
    end
  end

  module Menus

    def self.main
      return Views::Headers::welcome_header +
        "Select an option\n".colorize(:yellow) +
        " (1) Add contact\n"\
                " (2) Edit contact\n"\
                " (3) View contacts\n"\
                " (4) Delete contact\n\n".colorize(:red) +
        Views::Inputs::enter_option
    end

    def self.quit_or_back
      return "Select an option\n".colorize(:yellow) +
        " (0) Quit\n"\
                " (1) Back\n\n".colorize(:red) +
        Views::Inputs::enter_option
    end

    def self.quit_or_home
      return "Select an option\n".colorize(:yellow) +
        " (0) Quit\n"\
                " (1) Home\n\n".colorize(:red) +
        Views::Inputs::enter_option
    end

  end

  module Inputs

    def self.enter_yes_or_no(question)
      return "#{question} \n".colorize(:blue) +
        "(1) Yes\n" \
        "(2) No\n\n".colorize(:yellow) +
        self.enter_option

    end

    def self.enter_option
      return "Please select from the options above: ".colorize(:blue)
    end

    def self.enter_data(name)
      return "Please enter #{name}: ".colorize(:yellow)
    end

    def self.enter_contact_number(first_name, last_name)
      return "Please enter contact number of #{first_name} #{last_name}: ".colorize(:yellow)
    end
  end

  module Errors

    def self.invalid_option
      return Views::Headers::error_header +
        "Invalid option selected.\n"\
              "Please try again\n".colorize(:red)
    end

    def self.option_out_of_range
      return Views::Headers::error_header +
        "Option out of range\n"\
              "Please try again\n".colorize(:red)

    end

    def self.empty_input(name)
      return "#{name} should not be empty\n".colorize(:red)
    end
  end
end
