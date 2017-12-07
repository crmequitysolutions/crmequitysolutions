require 'test_helper'
include Warden::Test::Helpers

class RoomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "validates presence of required fields" do
    @david = User.create(email: "david@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))
    login_as(@david)
    room = Room.new
    room.property_id = 12345
    assert_not room.save
    room = Room.new
    room.room_id = 12345
    assert_not room.save
    room = Room.new
    room.property_id = 12345
    room.room_id = 12345
    assert room.save
  end
end
