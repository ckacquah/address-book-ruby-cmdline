class ViewContactController < Controller
  def run
    Screen::clear_and_render("View Contacts\n".colorize(:yellow))
    contacts = @db.get_all_contacts
    Views::Contacts::render_all(contacts)
    @router.display('/end')
  end
end
