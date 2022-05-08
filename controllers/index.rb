class Controller
  attr_reader :router, :db

  def initialize(router, db = DB_CONNECTION)
    @db = db
    @router = router
  end
end

class MainMenuController < Controller
  def display_menu
    Screen::clear_and_render(Views::Menus::main)
  end

  def run
    display_menu
    option = Screen::get_input
    case option
    when "1"
      @router.navigate_to('/add')
    when "2"
      @router.navigate_to('/edit')
    when "3"
      @router.navigate_to('/view')
    when "4"
      @router.navigate_to("/delete")
    else
      @router.navigate_to('/invalid-option')
    end
  end
end

class InvalidOptionController < Controller
  def display_menu
    Screen::clear_and_render(Views::Errors::invalid_option)
    Screen::render_view(Views::Menus::quit_home_back)
  end

  def run
    display_menu
    option = Screen::get_input
    case option
    when "0"
      @router.navigate_to("/exit")
    when "1"
      @router.navigate_back
    else
      self.run
    end
  end
end

class InputOutOfRangeController < Controller
  def display_menu
    Screen::clear_and_render(Views::Errors::option_out_of_range)
    Screen::render_view(Views::Menus::quit_home_back)
  end

  def run
    display_menu
    option = Screen::get_input
    case option
    when "0"
      @router.navigate_to("/exit")
    when "1"
      @router.navigate_back
    else
      self.run
    end
  end
end

class EndMenuController < Controller
  def run
    option = Screen::get_input(Views::Menus::quit_home_back)
    case option
    when "0"
      @router.navigate_to("/exit")
    when "1"
      @router.navigate_to("/")
    when "2"
      @router.navigate_back
    else
      @router.navigate_to('/invalid-option')
    end
  end
end

class ExitAppController < Controller
  def run
    Screen::clear_and_render(Views::Headers::exit_header)
    exit
  end
end