require 'test_helper'
include Warden::Test::Helpers

class InteractionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "validates uniqueness of interaction id" do
    @david = User.create(email: "david@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))
    login_as(@david)
    interaction = Interaction.new
    interaction.date_time = "2017-12-07 03:26:00 UTC"
    interaction.interaction_type = "Phone"
    interaction.result = "Sale"
    interaction.interaction_id = 12345
    interaction.save
    interaction = Interaction.new
    interaction.date_time = "2017-12-07 03:26:00 UTC"
    interaction.interaction_type = "Phone"
    interaction.result = "Sale"
    interaction.interaction_id = 12345
    assert_not interaction.save
    interaction.interaction_id = 123456
    assert interaction.save
  end
  
  test "validates presence of required fields" do
    @david = User.create(email: "david@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))
    login_as(@david)
    interaction = Interaction.new
    interaction.interaction_type = "Phone"
    interaction.result = "Sale"
    interaction.interaction_id = 12345
    assert_not interaction.save
    interaction = Interaction.new
    interaction.date_time = "2017-12-07 03:26:00 UTC"
    interaction.result = "Sale"
    interaction.interaction_id = 123456
    assert_not interaction.save
    interaction = Interaction.new
    interaction.date_time = "2017-12-07 03:26:00 UTC"
    interaction.interaction_type = "Phone"
    interaction.interaction_id = 123457
    assert_not interaction.save
    interaction = Interaction.new
    interaction.date_time = "2017-12-07 03:26:00 UTC"
    interaction.interaction_type = "Phone"
    interaction.result = "Sale"
    assert_not interaction.save
    interaction = Interaction.new
    interaction.date_time = "2017-12-07 03:26:00 UTC"
    interaction.interaction_type = "Phone"
    interaction.result = "Sale"
    interaction.interaction_id = 123458
    assert interaction.save
  end
end
