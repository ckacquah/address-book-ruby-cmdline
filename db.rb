module Database

  DB_PATH = Config::get_db_path

  def self.read_contacts_from_file
    contacts = Array.new
    begin
      File.open(DB_PATH, "r") do |file|
        file_content = file.read
        db_content = JSON.parse(file_content)
        if db_content.has_key?('contacts')
          db_content['contacts'].each { |contact_dict|
            contacts.append(Contact.from_dict(contact_dict))
          }
        end
      end
    rescue JSON::ParserError
      puts "The database file is empty OR has an invalid format"
    end
    return contacts
  end

  def self.write_contacts_to_file(contacts)
    File.open(DB_PATH, "w") { |file| file.write(JSON.pretty_generate({ 'contacts': contacts })) }
  end
end

class ContactDatabase

  attr_reader :contacts

  def initialize
    @contacts = Database::read_contacts_from_file()
  end

  def get_all_contacts
    @contacts
  end

  def read(index)
    @contacts[index]
  end

  def insert(contact)
    @contacts.append(contact)
    Database::write_contacts_to_file(@contacts)
  end

  def update(index, contact)
    @contacts[index] = contact
    Database::write_contacts_to_file(@contacts)
  end

  def delete(index)
    @contacts.delete_at(index)
    Database::write_contacts_to_file(@contacts)
  end
end

DB_CONNECTION = ContactDatabase.new
