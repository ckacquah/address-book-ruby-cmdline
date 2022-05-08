class History

  attr_reader :history

  def initialize
    @history = []
  end

  def push_path(path)
    @history.push(path)
  end

  def get_previous_path
    @history[-2]
  end

  def clear_history
    @history = []
  end

  def remove_last_path
    @history.pop
  end

end

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