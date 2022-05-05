class Contact
  attr_reader :first_name, :last_name, :phone

  def initialize(first_name, last_name, phone)
    @first_name = first_name
    @last_name = last_name
    @phone = phone
  end

  def self.from_dict(contact)
    return Contact.new(contact['first_name'], contact['last_name'], contact['phone'])
  end

  def to_dict
    return {
      :first_name => @first_name,
      :last_name => @last_name,
      :phone=> @phone,
    }
  end

  def to_json(tab)
    return to_dict.to_json(tab)
  end
end