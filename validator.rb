require_relative 'screen'

module Validator

  def self.take_valid_input(view)
    input = Screen::get_input(view)
    until self.is_valid_input?(input)
      Screen::render_view("Input must not be empty.\n".colorize(:red))
      input = Screen::get_input(view)
    end
    return input
  end

  def self.take_valid_number(view)
    input = Screen::get_input(view)
    until self.is_valid_number?(input)
      Screen::render_view("Input must be a valid.\n".colorize(:red))
      input = Screen::get_input(view)
    end
    return input
  end

  def self.take_valid_phone(view)
    input = Screen::get_input(view)
    until self.is_valid_phone?(input)
      Screen::render_view("Input must be a valid phone number.\n".colorize(:red))
      input = Screen::get_input(view)
    end
    return input
  end

  def self.is_valid_input?(input)
    return input != ""
  end

  def self.is_valid_number?(input)
    self.is_valid_input?(input) and /\A\d+\Z/.match?(input) ? true : false
  end

  def self.is_valid_phone?(input)
    self.is_valid_number?(input) and input.length == 10 ? true : false
  end
end
