# Authored by: Mitchell Berger, Talha Koc, and Noah Over for COMPSCI 408 at Duke University for Tori Patterson

require 'test_helper'
include Warden::Test::Helpers

class RentalUnitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "validates uniqueness of rental unit id" do
    @david = User.create(email: "david@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))
    login_as(@david)
    rental_unit = RentalUnit.new
    rental_unit.property_id = 12345
    rental_unit.rental_unit_id = 12345
    rental_unit.save
    rental_unit = RentalUnit.new
    rental_unit.property_id = 12345
    rental_unit.rental_unit_id = 12345
    assert_not rental_unit.save
    rental_unit.rental_unit_id = 123456
    assert rental_unit.save
  end
  
  test "validates presence of required fields" do
    @david = User.create(email: "david@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))
    login_as(@david)
    rental_unit = RentalUnit.new
    rental_unit.rental_unit_id = 12345
    assert_not rental_unit.save
    rental_unit = RentalUnit.new
    rental_unit.property_id = 12345
    assert_not rental_unit.save
    rental_unit = RentalUnit.new
    rental_unit.property_id = 12345
    rental_unit.rental_unit_id = 12345
    assert rental_unit.save
  end
end
