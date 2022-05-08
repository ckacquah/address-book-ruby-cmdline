class AddContactController < Controller
  def get_contact_info
    first_name = Input::get_with_validator("first name").capitalize
    last_name = Input::get_with_validator("last name").capitalize
    phone = Input::get_phone_with_validator(first_name, last_name)
    Contact.new(first_name, last_name, phone)
  end

  def handle_add(contact)
    Screen::render_view(Views::Contacts::summary(contact))
    option = Input::get_yes_or_no("\nDo you want to save the new contact?")
    case option
    when "1"
      Screen::clear
      @db.insert(contact)
      puts "Contact saved successfully!".colorize(:green)
      @router.navigate_to("/end")
    when "2"
      @router.navigate_to("/end")
    else
      Screen::clear_and_render(Views::Errors::invalid_option)
      self.handle_add(contact)
    end
  end

  def run
    Screen::clear_and_render("Add Contact\n\n".colorize(:yellow))
    contact = get_contact_info
    self.handle_add(contact)
  end
end