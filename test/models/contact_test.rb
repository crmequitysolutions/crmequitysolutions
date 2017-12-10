require 'test_helper'
include Warden::Test::Helpers

class ContactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "validates email" do
    @david = User.create(email: "david@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))
    login_as(@david)
    contact = Contact.new
    contact.contact_id = 123456
    contact.address_id = 123456
    contact.first_name = "Noah"
    contact.last_name = "Over"
    contact.phone = "5555555555"
    contact.contact_type = "Student"
    contact.email = "abcdef"
    assert_not contact.save
    contact.email = "noah@gmail.com"
    assert contact.save
  end
  
  test "validates phone" do
    @david = User.create(email: "david@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))
    login_as(@david)
    contact = Contact.new
    contact.contact_id = 123456
    contact.address_id = 123456
    contact.first_name = "Noah"
    contact.last_name = "Over"
    contact.contact_type = "Student"
    contact.email = "noah@over.com"
    contact.phone = 123
    contact.alt_phone = "5555555555"
    contact.fax = "5555555555"
    assert_not contact.save
    contact.phone = "5555555555"
    contact.alt_phone = 123
    assert_not contact.save
    contact.alt_phone = "5555555555"
    contact.fax = 123
    assert_not contact.save
  end
  
  test "validates id uniqueness" do
    @david = User.create(email: "david@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))
    login_as(@david)
    contact = Contact.new
    contact.contact_id = 123456
    contact.address_id = 123456
    contact.first_name = "Noah"
    contact.last_name = "Over"
    contact.contact_type = "Student"
    contact.email = "noah@over.com"
    contact.phone = "5555555555"
    contact.save
    contact1 = Contact.new
    contact1.contact_id = 123456
    contact1.address_id = 1234
    contact1.first_name = "Rita"
    contact1.last_name = "Shaffer"
    contact1.contact_type = "Grandmother"
    contact1.email = "rita@shaffer.com"
    contact1.phone = "5555555555"
    assert_not contact1.save
    contact1.contact_id = 654321
    assert contact1.save
  end
  
  test "validates presence of ..." do
    @david = User.create(email: "david@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))
    login_as(@david)
    contact = Contact.new
    contact.address_id = 123456
    contact.first_name = "Noah"
    contact.last_name = "Over"
    contact.contact_type = "Student"
    contact.email = "noah@over.com"
    contact.phone = "5555555555"
    assert_not contact.save
    contact = Contact.new
    contact.contact_id = 123456
    contact.first_name = "Noah"
    contact.last_name = "Over"
    contact.contact_type = "Student"
    contact.email = "noah@over.com"
    contact.phone = "5555555555"
    assert_not contact.save
    contact = Contact.new
    contact.contact_id = 123456
    contact.address_id = 123456
    contact.last_name = "Over"
    contact.contact_type = "Student"
    contact.email = "noah@over.com"
    contact.phone = "5555555555"
    assert_not contact.save
    contact = Contact.new
    contact.contact_id = 123456
    contact.address_id = 123456
    contact.first_name = "Noah"
    contact.contact_type = "Student"
    contact.email = "noah@over.com"
    contact.phone = "5555555555"
    assert_not contact.save
    contact = Contact.new
    contact.contact_id = 123456
    contact.address_id = 123456
    contact.first_name = "Noah"
    contact.last_name = "Over"
    contact.email = "noah@over.com"
    contact.phone = "5555555555"
    assert_not contact.save
    contact = Contact.new
    contact.contact_id = 123456
    contact.address_id = 123456
    contact.first_name = "Noah"
    contact.last_name = "Over"
    contact.contact_type = "Student"
    contact.phone = "5555555555"
    assert_not contact.save
    contact = Contact.new
    contact.contact_id = 123456
    contact.address_id = 123456
    contact.first_name = "Noah"
    contact.last_name = "Over"
    contact.contact_type = "Student"
    contact.email = "noah@over.com"
    assert_not contact.save
  end
  
end
