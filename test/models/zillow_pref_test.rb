# Authored by: Mitchell Berger, Talha Koc, and Noah Over for COMPSCI 408 at Duke University for Tori Patterson

require 'test_helper'
include Warden::Test::Helpers

class ZillowPrefTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "validates uniqueness of user email" do
    @david = User.create(email: "david@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))
    login_as(@david)
    zillow_pref = ZillowPref.new
    zillow_pref.user_email = "david@mail.com"
    zillow_pref.save
    zillow_pref = ZillowPref.new
    zillow_pref.user_email = "david@mail.com"
    assert_not zillow_pref.save
    zillow_pref.user_email = "dave@mail.com"
    assert zillow_pref.save
  end
  
  test "validates presence of required fields" do
    @david = User.create(email: "david@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))
    login_as(@david)
    zillow_pref = ZillowPref.new
    assert_not zillow_pref.save
    zillow_pref = ZillowPref.new
    zillow_pref.user_email = "david@mail.com"
    assert zillow_pref.save
  end
end
