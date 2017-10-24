require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "validates email" do
    contact = Contact.new
    contact.contact_id = 123456
    contact.address_id = 123456
    contact.first_name = "Noah"
    contact.last_name = "Over"
    contact.phone = 8145056211
    contact.contact_type = "Student"
    contact.email = "abcdef"
    assert_not contact.save
    contact.email = "nko2@duke.edu"
    assert contact.save
  end
  
  test "validates phone" do
    contact = Contact.new
    contact.contact_id = 123456
    contact.address_id = 123456
    contact.first_name = "Noah"
    contact.last_name = "Over"
    contact.contact_type = "Student"
    contact.email = "nko2@duke.edu"
    contact.phone = 123
    contact.alt_phone = 8145056211
    contact.fax = 8145056211
    assert_not contact.save
    contact.phone = 8145056211
    contact.alt_phone = 123
    assert_not contact.save
    contact.alt_phone = 8145056211
    contact.fax = 123
    assert_not contact.save
  end
  
  test "validates id uniqueness" do
    contact = Contact.new
    contact.contact_id = 123456
    contact.address_id = 123456
    contact.first_name = "Noah"
    contact.last_name = "Over"
    contact.contact_type = "Student"
    contact.email = "nko2@duke.edu"
    contact.phone = 8145056211
    contact.save
    contact1 = Contact.new
    contact1.contact_id = 123456
    contact1.address_id = 1234
    contact1.first_name = "Rita"
    contact1.last_name = "Shaffer"
    contact1.contact_type = "Grandmother"
    contact1.email = "rita.shaffer@atlanticbb.net"
    contact1.phone = 8142244692
    assert_not contact1.save
    contact1.contact_id = 654321
    assert contact1.save
  end
  
  test "validates presence of ..." do
    contact = Contact.new
    contact.address_id = 123456
    contact.first_name = "Noah"
    contact.last_name = "Over"
    contact.contact_type = "Student"
    contact.email = "nko2@duke.edu"
    contact.phone = 8145056211
    assert_not contact.save
    contact = Contact.new
    contact.contact_id = 123456
    contact.first_name = "Noah"
    contact.last_name = "Over"
    contact.contact_type = "Student"
    contact.email = "nko2@duke.edu"
    contact.phone = 8145056211
    assert_not contact.save
    contact = Contact.new
    contact.contact_id = 123456
    contact.address_id = 123456
    contact.last_name = "Over"
    contact.contact_type = "Student"
    contact.email = "nko2@duke.edu"
    contact.phone = 8145056211
    assert_not contact.save
    contact = Contact.new
    contact.contact_id = 123456
    contact.address_id = 123456
    contact.first_name = "Noah"
    contact.contact_type = "Student"
    contact.email = "nko2@duke.edu"
    contact.phone = 8145056211
    assert_not contact.save
    contact = Contact.new
    contact.contact_id = 123456
    contact.address_id = 123456
    contact.first_name = "Noah"
    contact.last_name = "Over"
    contact.email = "nko2@duke.edu"
    contact.phone = 8145056211
    assert_not contact.save
    contact = Contact.new
    contact.contact_id = 123456
    contact.address_id = 123456
    contact.first_name = "Noah"
    contact.last_name = "Over"
    contact.contact_type = "Student"
    contact.phone = 8145056211
    assert_not contact.save
    contact = Contact.new
    contact.contact_id = 123456
    contact.address_id = 123456
    contact.first_name = "Noah"
    contact.last_name = "Over"
    contact.contact_type = "Student"
    contact.email = "nko2@duke.edu"
    assert_not contact.save
  end
  
end
