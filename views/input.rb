module Views

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

