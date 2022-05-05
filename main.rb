require_relative 'db'

# puts "1. Add contact"
# puts "\n2. Read contact"
# puts "\n3. Update contact"
# puts "\n4. Delete contact"
# puts "\n0. Exit"
#
# value = gets.chomp
# puts value
# Database::write_contacts_to_file([Contact.new('John', 'Doe', '+2330203944')])
# puts read_contacts_from_file

connection = ContactDatabase.new()
connection.insert(Contact.new('Jack', 'Doe', '+2330203944'))
connection.update(0, Contact.new('Jane', 'Doe', '+2330203944'))
# connection.delete(0)

puts connection.read(0).to_dict