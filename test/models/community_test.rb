# Authored by: Mitchell Berger, Talha Koc, and Noah Over for COMPSCI 408 at Duke University for Tori Patterson

require 'test_helper'
include Warden::Test::Helpers

class CommunityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "validates zip code" do
    @david = User.create(email: "david@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))
    login_as(@david)
    community = Community.new
    community.community_name = "My Community"
    community.zip_code = "1234"
    community.community_id = 12345
    assert_not community.save
    community.zip_code = "12345"
    assert community.save
    community = Community.new
    community.community_name = "My Community"
    community.zip_code = "12345-1234"
    community.community_id = 123456
    assert community.save
  end
  
  test "validates uniqueness of community id" do
    @david = User.create(email: "david@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))
    login_as(@david)
    community = Community.new
    community.community_name = "My Community"
    community.zip_code = "12345"
    community.community_id = 12345
    community.save
    community = Community.new
    community.community_name = "My Community"
    community.zip_code = "12345"
    community.community_id = 12345
    assert_not community.save
    community.community_id = 123456
    assert community.save
  end
  
  test "validates presence of required fields" do
    @david = User.create(email: "david@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))
    login_as(@david)
    community = Community.new
    community.zip_code = "12345"
    community.community_id = 12345
    assert_not community.save
    community = Community.new
    community.community_name = "My Community"
    community.community_id = 123456
    assert_not community.save
    community = Community.new
    community.community_name = "My Community"
    community.zip_code = "12345"
    assert_not community.save
    community = Community.new
    community.community_name = "My Community"
    community.zip_code = "12345"
    community.community_id = 123457
    assert community.save
  end
end
