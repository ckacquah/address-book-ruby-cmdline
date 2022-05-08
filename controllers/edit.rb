class EditContactController < Controller

  def get_updated_contact_info(old_contact)
    first_name = Validator::take_valid_input(
      Views::Inputs::enter_data("new first name (#{old_contact.first_name})"))
    last_name = Validator::take_valid_input(
      Views::Inputs::enter_data("new last name (#{old_contact.last_name})"))
    phone = Validator::take_valid_phone(
      Views::Inputs::enter_contact_number(first_name, last_name + " (#{old_contact.phone})"))
    Contact.new(first_name, last_name, phone)
  end

  def handle_edit(index)
    old_contact = @db.read(index)
    contact = get_updated_contact_info(old_contact)
    option = Screen::get_input(
      Views::Inputs::enter_yes_or_no("\nDo you want to update the contact?"))
    case option
    when "1"
      @db.update(index, contact)
      Screen::clear_and_render("Contact has been updated successfully!".colorize(:green))
      @router.navigate_to("/quit-or-home")
    when "2"
      @router.navigate_to("/quit-or-home")
    else
      @router.navigate_to('/invalid-option')
    end
  end

  def run
    Screen::clear_and_render("Edit Contact\n\n".colorize(:yellow))
    contacts = @db.get_all_contacts
    Views::Contacts::render_all(contacts)
    option = Validator::take_number_within(
      Views::Inputs::enter_option, -1, contacts.length)
    self.handle_edit(option.to_i)
  end
end
