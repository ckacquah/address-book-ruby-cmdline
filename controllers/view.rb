require_relative 'index'
require_relative '../screen'
require_relative '../views'

class ViewContactController < Controller
  def run
    Screen::clear_and_render("View Contacts\n\n".colorize(:yellow))
    contacts = @db.get_all_contacts
    if contacts.length == 0
      Screen::render_view(Views::Contacts::empty)
    else
      Views::Contacts::render_all(contacts)
    end
    @router.navigate_to('/quit-or-home')
  end
end
