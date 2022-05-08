Dotenv.load

module Config
  def self.get_db_path
    return ENV["DB_PATH"]
  end
end
