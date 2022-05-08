require_relative '../models/contact'

class DatabaseFileHandler

  attr_reader :db_path, :name, :model

  def initialize(db_path, name, model)
    @db_path = db_path
    @name = name
    @model = model
  end

  def retrieve_content_from_db
    model_items = []
    begin
      File.open(@db_path, "r") do |file|
        db_content = JSON.parse(file.read)
        if db_content.has_key?(@name) then
          db_content[@name].each \
            { |model_hash_item| model_items.append(@model::from_dict(model_hash_item)) }
        end
      end
    rescue JSON::ParserError
      puts "The database file is empty OR has an invalid format"
    end
    model_items
  end

  def write_content_to_db(items)
    File.open(@db_path, "w") \
      { |file| file.write(JSON.pretty_generate({ @name => items })) }
  end

end

class ContactDatabase

  attr_reader :contacts, :handler

  def initialize(path)
    @handler = DatabaseFileHandler.new(path, "contacts", Contact)
    self.refresh
  end

  def get_all_contacts
    self.refresh
    @contacts
  end

  def refresh
    @contacts = @handler.retrieve_content_from_db()
  end

  def read(index)
    @contacts[index]
  end

  def insert(contact)
    @contacts.append(contact)
    @handler.write_content_to_db(@contacts)
  end

  def update(index, contact)
    @contacts[index] = contact
    @handler.write_content_to_db(@contacts)
  end

  def delete(index)
    @contacts.delete_at(index)
    @handler.write_content_to_db(@contacts)
  end

end

