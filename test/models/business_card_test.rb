require 'test_helper'
include Warden::Test::Helpers

class BusinessCardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "validates presence of required fields" do
    @david = User.create(email: "david@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))
    login_as(@david)
    business_card = BusinessCard.new
    business_card.image = "image.jpg"
    assert_not business_card.save
    business_card = BusinessCard.new
    business_card.contact_id = 12345
    assert_not business_card.save
    business_card = BusinessCard.new
  end
end
