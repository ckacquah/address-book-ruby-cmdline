class DeleteContactController < Controller

  def handle_delete(index, contact)
    Screen::render_view(Views::Contacts::summary(contact))
    option = Input::get_yes_or_no("\nDo you want to delete the contact?")
    case option
    when "1"
      @db.delete(index)
      Screen::clear_and_render("Contact has been deleted successfully!".colorize(:green))
      @router.navigate_to("/end")
    when "2"
      @router.navigate_to("/end")
    else
      Screen::clear_and_render(Views::Errors::invalid_option)
      self.handle_delete(index, contact)
    end
  end

  def run
    Screen::clear_and_render("Delete Contact\n".colorize(:yellow))
    contacts = @db.get_all_contacts
    if Views::Contacts::render_all(contacts)
      index = Input::get_within_range(0, contacts.length - 1)
      contact = @db.read(index)
      self.handle_delete(index, contact)
      @router.navigate_to("/end")
    else
      @router.display('/end')
    end
  end
  
end
