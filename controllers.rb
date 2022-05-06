require_relative 'views'
require_relative 'screen'
require_relative 'contact'

class Controller
  attr_reader :router, :db

  def initialize(router, db = nil)
    @db = db
    @router = router
  end
end

