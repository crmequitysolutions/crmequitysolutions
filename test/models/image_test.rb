# Authored by: Mitchell Berger, Talha Koc, and Noah Over for COMPSCI 408 at Duke University for Tori Patterson

require 'test_helper'
include Warden::Test::Helpers

class ImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "validates presence of required fields" do
    @david = User.create(email: "david@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))
    login_as(@david)
    image = Image.new
    image.image = "image.jpg"
    assert_not image.save
    image = Image.new
    image.property_id = 12345
    assert_not image.save
  end
end
