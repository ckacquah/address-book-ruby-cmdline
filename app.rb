require 'json'
require 'dotenv'
require 'colorize'

require_relative 'db/index'
require_relative 'route/index'

class AddressBookApplication
  def start
    APP_ROUTER.navigate_to('/')
  end
end