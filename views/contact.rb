module Views

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
        false
      else
        Screen::render_view("\n---------------------------\n".colorize(:green))
        contacts.each_with_index do |contact, index|
          Screen::render_view(
            "(#{index}) Name: #{contact.first_name} #{contact.last_name}\n"\
        "   Phone: #{contact.phone}\n".colorize(:yellow) +
              "---------------------------\n".colorize(:green)
          )
          true
        end
      end
    end

    def self.empty
      "\n---------------------------\n".colorize(:blue) +
        "\n** Contact list is empty **\n".colorize(:yellow) +
        "\n---------------------------\n".colorize(:blue)
    end

  end

end