class EditContactController < Controller

  def get_updated_contact_info(old_contact)
    first_name = Input::get("new first name (#{old_contact.first_name})")
    last_name = Input::get("new last name (#{old_contact.last_name})")
    first_name = first_name == "" ? old_contact.first_name : first_name.capitalize
    last_name = last_name == "" ? old_contact.last_name : last_name.capitalize
    phone = Input::get_phone(first_name, last_name + " (#{old_contact.phone})")
    Contact.new(
      first_name, last_name,
      phone == "" ? old_contact.phone : phone
    )
  end

  def handle_edit(index)
    old_contact = @db.read(index)
    contact = get_updated_contact_info(old_contact)
    Screen::render_view(Views::Contacts::summary(contact))
    option = Input::get_yes_or_no("\nDo you want to update the contact?")
    case option
    when "1"
      @db.update(index, contact)
      Screen::clear_and_render("Contact has been updated successfully!".colorize(:green))
      @router.navigate_to("/end")
    when "2"
      @router.navigate_to("/end")
    else
      @router.display('/invalid')
    end
  end

  def run
    Screen::clear_and_render("Edit Contact\n\n".colorize(:yellow))
    contacts = @db.get_all_contacts
    Views::Contacts::render_all(contacts)
    index = Input::get_within_range(0, contacts.length - 1)
    self.handle_edit(index)
  end
end
