require_relative 'db'
require_relative 'route'

require_relative 'controllers/index'
require_relative 'controllers/add'
require_relative 'controllers/edit'
require_relative 'controllers/view'
require_relative 'controllers/delete'

class ContactApplication

  attr_reader :routes, :router, :db

  def initialize
    @db = ContactDatabase.new
    @router = ContactApplicationRouter.new({})
    self.register_paths
  end

  def register_paths
    @routes = {
      '/' => MainController.new(@router),
      '/add' => AddContactController.new(@router, @db),
      '/view' => ViewContactController.new(@router, @db),
      '/edit' => EditContactController.new(@router, @db),
      '/delete' => DeleteContactController.new(@router, @db),
      '/invalid-option' => InvalidOptionController.new(@router),
      '/quit-or-home' => QuitOrHomeController.new(@router),
      '/input-out-of-range' => InputOutOfRangeController.new(@router)
    }
    @router.register_paths(@routes)
  end

  def start
    @router.navigate_to('/')
  end
end