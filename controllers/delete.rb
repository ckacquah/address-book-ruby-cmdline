class DeleteContactController < Controller
  def handle_delete(index)
    contact = @db.read(index)
    Screen::render_view(Views::Contacts::summary(contact))
    option = Input::get_yes_or_no("\nDo you want to delete the contact?")
    case option
    when "1"
      @db.delete(index)
      Screen::clear
      puts "Contact has been deleted successfully!".colorize(:green)
      @router.navigate_to("/end")
    when "2"
      @router.navigate_to("/delete")
    else
      @router.display('/invalid')
    end
  end

  def run
    Screen::clear_and_render("Delete Contact\n\n".colorize(:yellow))
    contacts = @db.get_all_contacts
    Views::Contacts::render_all(contacts)
    index = Input::get_within_range(0, contacts.length - 1)
    self.handle_delete(index)
    @router.navigate_to("/end")
  end
end
