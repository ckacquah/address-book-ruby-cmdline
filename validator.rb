module Validator

  def self.take_valid_input(view)
    input = Screen::get_input(view)
    until self.is_valid_input?(input)
      Screen::render_view("Input must not be empty.\n".colorize(:red))
      input = Screen::get_input(view)
    end
    input
  end

  def self.take_valid_number(view)
    input = Screen::get_input(view)
    until self.is_valid_number?(input)
      Screen::render_view("Input must be a valid.\n".colorize(:red))
      input = Screen::get_input(view)
    end
    input
  end

  def self.take_number_within(view, start_index, end_index)
    input = Screen::get_input(view)
    until self.is_within_range?(input, start_index, end_index)
      Screen::render_view(
        "Option must be within range (#{start_index + 1}, #{end_index - 1}).\n".colorize(:red))
      input = Screen::get_input(view)
    end
    input.to_i
  end

  def self.take_valid_phone(view)
    input = Screen::get_input(view)
    until self.is_valid_phone?(input)
      Screen::render_view("Input must be a valid phone number.\n".colorize(:red))
      input = Screen::get_input(view)
    end
    input
  end

  def self.is_valid_input?(input)
    input != ""
  end

  def self.is_valid_number?(input)
    self.is_valid_input?(input) and /\A\d+\Z/.match?(input)
  end

  def self.is_within_range?(input, start_index, end_index)
    self.is_valid_input?(input) and is_valid_number?(input) and \
    input.to_i > start_index and input.to_i < end_index
  end

  def self.is_valid_phone?(input)
    self.is_valid_number?(input) and input.length == 10
  end
end
