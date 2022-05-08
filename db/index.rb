require_relative 'config'
require_relative 'database'

DB_CONNECTION = ContactDatabase.new(DB_PATH)
