class DeleteContactController < Controller
  def handle_delete(index)
    contact = @db.read(index)
    Screen::render_view(Views::Contacts::summary(contact))
    option = Screen::get_input(
      Views::Inputs::enter_yes_or_no("\nDo you want to delete the contact?"))
    case option
    when "1"
      @db.delete(index)
      Screen::clear
      puts "Contact has been deleted successfully!".colorize(:green)
      @router.navigate_to("/end")
    when "2"
      @router.navigate_to("/delete")
    else
      @router.navigate_to('/invalid-option')
    end
  end

  def run
    Screen::clear_and_render("Delete Contact\n\n".colorize(:yellow))
    contacts = @db.get_all_contacts
    Views::Contacts::render_all(contacts)
    option = Validator::take_number_within(
      Views::Inputs::enter_option, -1, contacts.length)
    self.handle_delete(option.to_i)
    @router.navigate_to("/end")
  end
end
