# Authored by: Mitchell Berger, Talha Koc, and Noah Over for COMPSCI 408 at Duke University for Tori Patterson

require 'test_helper'
include Warden::Test::Helpers

class PropertyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "validates uniqueness of property id" do
    @david = User.create(email: "david@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))
    login_as(@david)
    property = Property.new
    property.address_id = 12345
    property.owner = 12345
    property.property_id = 12345
    property.user_email = "david@mail.com"
    property.save
    property = Property.new
    property.address_id = 12345
    property.owner = 12345
    property.property_id = 12345
    property.user_email = "david@mail.com"
    assert_not property.save
    property.property_id = 123456
    assert property.save
  end
  
  test "validates presence of required fields" do
    @david = User.create(email: "david@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))
    login_as(@david)
    property = Property.new
    property.owner = 12345
    property.property_id = 12345
    property.user_email = "david@mail.com"
    assert_not property.save
    property = Property.new
    property.address_id = 12345
    property.property_id = 12345
    property.user_email = "david@mail.com"
    assert_not property.save
    property = Property.new
    property.address_id = 12345
    property.owner = 12345
    property.user_email = "david@mail.com"
    assert_not property.save
    property = Property.new
    property.address_id = 12345
    property.owner = 12345
    property.property_id = 12345
    assert_not property.save
    property = Property.new
    property.address_id = 12345
    property.owner = 12345
    property.property_id = 12345
    property.user_email = "david@mail.com"
    assert property.save
  end
end
