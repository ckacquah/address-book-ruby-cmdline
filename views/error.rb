module Views

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