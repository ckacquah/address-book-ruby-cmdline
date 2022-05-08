class Router

  attr_reader :history, :route_map

  def initialize
    @history = []
    @route_map = {}
  end

  def register_path(path, action)
    @route_map[path] = action
  end

  def get_controller(path)
    @route_map[path]
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

  def remove_last_item
    @history.pop
  end
end

class ContactApplicationRouter

  attr_reader :router

  def initialize(routes = {})
    @router = Router.new
    self.register_paths(routes)
  end

  def register_paths(routes)
    routes.each { |path, controller| @router.register_path(path, controller) }
  end

  def navigate_to(path)
    @router.push_path(path)
    controller = @router.get_controller(path)
    if controller == nil
      puts "No paths found"
    else
      controller.new(self).run
    end
  end

  def navigate_back
    path = @router.get_previous_path
    @router.remove_last_item
    controller = @router.get_controller(path)
    controller.new(self).run
  end

end