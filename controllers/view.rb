require_relative 'index'
require_relative '../screen'
require_relative '../views'

class ViewContactController < Controller
  def run
    Screen::clear_and_render("View Contacts\n\n".colorize(:yellow))
    contacts = @db.get_all_contacts
    Views::Contacts::render_all(contacts)
    @router.navigate_to('/quit-or-home')
  end
end
