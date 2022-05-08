require 'json'
require 'dotenv'
require 'colorize'

require_relative 'config'
require_relative 'contact'
require_relative 'db'

require_relative 'route'
require_relative 'views'
require_relative 'screen'
require_relative 'validator'

require_relative 'controllers/index'
require_relative 'controllers/add'
require_relative 'controllers/edit'
require_relative 'controllers/view'
require_relative 'controllers/delete'

class AddressBookApplication

  attr_reader :routes, :router, :db

  def initialize
    @db = ContactDatabase.new
    @router = ContactApplicationRouter.new({})
    self.register_paths
  end

  def register_paths
    @routes = {
      '/' => MainController,
      '/add' => AddContactController,
      '/view' => ViewContactController,
      '/edit' => EditContactController,
      '/exit' => ExitAppController,
      '/delete' => DeleteContactController,
      '/quit-or-home' => QuitOrHomeController,
      '/invalid-option' => InvalidOptionController,
      '/input-out-of-range' => InputOutOfRangeController
    }
    @router.register_paths(@routes)
  end

  def start
    @router.navigate_to('/')
  end
end