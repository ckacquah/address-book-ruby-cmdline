require_relative 'config'
require_relative 'router'

APP_ROUTER = Router.new
APP_ROUTER.register_paths(ROUTES)