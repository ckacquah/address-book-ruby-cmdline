require_relative 'index'
require_relative '../views'
require_relative '../screen'
require_relative '../validator'

class AddContactController < Controller
  def run
    Screen::clear_and_render("Add Contact\n\n".colorize(:yellow))
    first_name = Validator::take_valid_input(Views::Inputs::enter_data("first name"))
    last_name = Validator::take_valid_input(Views::Inputs::enter_data("last name"))
    phone = Validator::take_valid_phone(Views::Inputs::enter_contact_number(first_name, last_name))
    contact = Contact.new(first_name, last_name, phone)
    Screen::render_view(Views::Contacts::summary(contact))
    option = Screen::get_input(
      Views::Inputs::enter_yes_or_no("\nDo you want to save the new contact?"))
    case option
    when "1"
      @db.insert(Contact.new(first_name, last_name, phone))
      Screen::clear
      puts "Contact saved successfully!".colorize(:green)
      @router.navigate_to("/quit-or-home")
    when "2"
      @router.navigate_to("/")
    else
      @router.navigate_to('/invalid-option')
    end
  end
end