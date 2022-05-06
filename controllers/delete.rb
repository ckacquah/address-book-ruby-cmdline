require_relative 'index'
require_relative '../screen'
require_relative '../views'

class DeleteContactController < Controller
  def handle_delete(index)
    option = Screen::get_input(
      Views::Inputs::enter_yes_or_no("\nDo you want to delete the contact?"))
    case option
    when "1"
      @db.delete(index)
      Screen::clear
      puts "Contact has been delete successfully!".colorize(:green)
      @router.navigate_to("/quit-or-home")
    when "2"
      @router.navigate_to("/")
    else
      @router.navigate_to('/invalid-option')
    end
  end

  def run
    Screen::clear_and_render("Delete Contact\n\n".colorize(:yellow))
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
        self.handle_delete(index)
      else
        @router.navigate_to('/input-out-of-range')
      end
    end
    @router.navigate_to('/quit-or-home')
  end
end
