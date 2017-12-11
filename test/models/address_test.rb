# Authored by: Mitchell Berger, Talha Koc, and Noah Over for COMPSCI 408 at Duke University for Tori Patterson

require 'test_helper'
include Warden::Test::Helpers

class AddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "validates zip code" do
    @david = User.create(email: "david@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))
    login_as(@david)
    address = Address.new
    address.address_id = 12345
    address.line_1 = "123 Main St."
    address.city = "Durham"
    address.state = "NC"
    address.county = "Durham"
    address.country = "USA"
    address.school_district = "Durham"
    address.zip_code = "1234"
    assert_not address.save
    address.zip_code = "27705"
    assert address.save
    address = Address.new
    address.address_id = 123456
    address.line_1 = "123 Main St."
    address.city = "Durham"
    address.state = "NC"
    address.county = "Durham"
    address.country = "USA"
    address.school_district = "Durham"
    address.zip_code = "16695-9545"
    assert address.save
  end
  
  test "validates address id uniqueness" do
    @david = User.create(email: "david@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))
    login_as(@david)
    address = Address.new
    address.address_id = 12345
    address.line_1 = "123 Main St."
    address.city = "Durham"
    address.state = "NC"
    address.county = "Durham"
    address.country = "USA"
    address.school_district = "Durham"
    address.zip_code = "16695-9545"
    address.save
    address = Address.new
    address.address_id = 12345
    address.line_1 = "123 Main St."
    address.city = "Durham"
    address.state = "NC"
    address.county = "Durham"
    address.country = "USA"
    address.school_district = "Durham"
    address.zip_code = "16695-9545"
    assert_not address.save
    address.address_id = 12346
    assert address.save
  end
  
  test "validates state" do
    @david = User.create(email: "david@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))
    login_as(@david)
    address = Address.new
    address.address_id = 12345
    address.line_1 = "123 Main St."
    address.city = "Durham"
    address.county = "Durham"
    address.country = "USA"
    address.school_district = "Durham"
    address.zip_code = "16695-9545"
    address.state = "north"
    assert_not address.save
    address.state = "NC"
    assert address.save
  end
  
  test "validates presence of required fields" do
    @david = User.create(email: "david@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))
    login_as(@david)
    address = Address.new
    address.line_1 = "123 Main St."
    address.city = "Durham"
    address.state = "NC"
    address.county = "Durham"
    address.country = "USA"
    address.school_district = "Durham"
    address.zip_code = "16695-9545"
    assert_not address.save
    address = Address.new
    address.address_id = 1234
    address.city = "Durham"
    address.state = "NC"
    address.county = "Durham"
    address.country = "USA"
    address.school_district = "Durham"
    address.zip_code = "16695-9545"
    assert_not address.save
    address = Address.new
    address.address_id = 12345
    address.line_1 = "123 Main St."
    address.state = "NC"
    address.county = "Durham"
    address.country = "USA"
    address.school_district = "Durham"
    address.zip_code = "16695-9545"
    assert_not address.save
    address = Address.new
    address.address_id = 123456
    address.line_1 = "123 Main St."
    address.city = "Durham"
    address.county = "Durham"
    address.country = "USA"
    address.school_district = "Durham"
    address.zip_code = "16695-9545"
    assert_not address.save
    address = Address.new
    address.address_id = 123457
    address.line_1 = "123 Main St."
    address.city = "Durham"
    address.state = "NC"
    address.country = "USA"
    address.school_district = "Durham"
    address.zip_code = "16695-9545"
    assert_not address.save
    address = Address.new
    address.address_id = 123458
    address.line_1 = "123 Main St."
    address.city = "Durham"
    address.state = "NC"
    address.county = "Durham"
    address.school_district = "Durham"
    address.zip_code = "16695-9545"
    assert_not address.save
    address = Address.new
    address.address_id = 123459
    address.line_1 = "123 Main St."
    address.city = "Durham"
    address.state = "NC"
    address.county = "Durham"
    address.country = "USA"
    address.zip_code = "16695-9545"
    assert_not address.save
    address = Address.new
    address.address_id = 12345
    address.line_1 = "123 Main St."
    address.city = "Durham"
    address.state = "NC"
    address.county = "Durham"
    address.country = "USA"
    address.school_district = "Durham"
    assert_not address.save
    address = Address.new
    address.address_id = 12345
    address.line_1 = "123 Main St."
    address.city = "Durham"
    address.state = "NC"
    address.county = "Durham"
    address.country = "USA"
    address.school_district = "Durham"
    address.zip_code = "16695-9545"
    assert address.save
  end
end
