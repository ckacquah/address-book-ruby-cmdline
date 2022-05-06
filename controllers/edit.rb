require_relative 'index'
require_relative '../screen'
require_relative '../views'

class EditContactController < Controller
  def handle_edit(index)
    contact = @db.read(index)
    first_name = Validator::take_valid_input(
      Views::Inputs::enter_data("new first name (#{contact.first_name})"))
    last_name = Validator::take_valid_input(
      Views::Inputs::enter_data("new last name (#{contact.last_name})"))
    phone = Validator::take_valid_phone(
      Views::Inputs::enter_contact_number(first_name, last_name + " (#{contact.phone})"))
    option = Screen::get_input(
      Views::Inputs::enter_yes_or_no("\nDo you want to update the contact?"))
    case option
    when "1"
      @db.update(index, Contact.new(first_name, last_name, phone))
      Screen::clear
      puts "Contact has been updated successfully!".colorize(:green)
      @router.navigate_to("/quit-or-home")
    when "2"
      @router.navigate_to("/")
    else
      @router.navigate_to('/invalid-option')
    end
  end

  def run
    Screen::clear_and_render("Edit Contact\n\n".colorize(:yellow))
    contacts = @db.get_all_contacts
    if contacts.length == 0
      Screen::render_view(Views::Contacts::empty)
    else
      Views::Contacts::render_all(contacts)
      option = Screen::get_input(Views::Inputs::enter_option)
      if not Validator::is_valid_number?(option)
        @router.navigate_to('/invalid-option')
      end
      index = option.to_i
      if index >= 0 and index < contacts.length
        self.handle_edit(index)
      else
        @router.navigate_to('/input-out-of-range')
      end
    end
    @router.navigate_to('/quit-or-home')
  end
end
