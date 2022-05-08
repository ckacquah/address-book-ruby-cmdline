require_relative '../db'

class Controller
  attr_reader :router, :db

  def initialize(router, db = DB_CONNECTION)
    @db = db
    @router = router
  end
end

class MainController < Controller
  def display_menu
    Screen::clear_and_render(Views::Menus::main)
    Screen::render_view(Views::Inputs::enter_option)
  end

  def run
    self.display_menu
    option = gets.chomp
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
    Screen::render_view(Views::Menus::quit_or_back)
  end

  def run
    self.display_menu
    option = Screen::get_input(Views::Inputs::enter_option)
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
    Screen::render_view(Views::Menus::quit_or_back)
  end

  def run
    self.display_menu
    option = Screen::get_input(Views::Inputs::enter_option)
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

class QuitOrHomeController < Controller
  def run
    option = Screen::get_input(Views::Menus::quit_or_home)
    case option
    when "0"
      @router.navigate_to("/exit")
    when "1"
      @router.navigate_to("/")
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