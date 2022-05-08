require_relative '../models/history'

class Router

  attr_reader :history, :routes

  def initialize(routes = {})
    @history = History.new
    @routes = routes
  end

  def register_paths(routes)
    routes.each { |path, controller| @routes[path] = controller }
  end

  def navigate_to(path)
    @history.push_path(path)
    controller = @routes[path]
    if controller == nil
      puts "No paths found"
    else
      controller.new(self).run
    end
  end

  def navigate_back
    path = @history.get_previous_path
    @history.remove_last_path
    controller = @routes[path]
    controller.new(self).run
  end

  def display(path)
    controller = @routes[path]
    controller.new(self).run
  end

end