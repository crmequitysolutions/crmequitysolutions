require 'test_helper'
include Warden::Test::Helpers

class InvestorPrefTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "validates zip code" do
    @david = User.create(email: "david@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))
    login_as(@david)
    investor_pref = InvestorPref.new
    investor_pref.contact_id = 12345
    investor_pref.investor_pref_id = 12345
    investor_pref.zip_code = "1234"
    assert_not investor_pref.save
    investor_pref.zip_code = "12345"
    assert investor_pref.save
    investor_pref = InvestorPref.new
    investor_pref.contact_id = 12345
    investor_pref.investor_pref_id = 123456
    investor_pref.zip_code = "12345-1234"
    assert investor_pref.save
  end
  
  test "validates uniqueness of investor pref id" do
    @david = User.create(email: "david@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))
    login_as(@david)
    investor_pref = InvestorPref.new
    investor_pref.contact_id = 12345
    investor_pref.investor_pref_id = 12345
    investor_pref.save
    investor_pref = InvestorPref.new
    investor_pref.contact_id = 12345
    investor_pref.investor_pref_id = 12345
    assert_not investor_pref.save
    investor_pref.investor_pref_id = 123456
    assert investor_pref.save
  end
  
  test "valides presence of required fields" do
    @david = User.create(email: "david@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))
    login_as(@david)
    investor_pref = InvestorPref.new
    investor_pref.investor_pref_id = 12345
    assert_not investor_pref.save
    investor_pref = InvestorPref.new
    investor_pref.contact_id = 12345
    assert_not investor_pref.save
    investor_pref = InvestorPref.new
    investor_pref.contact_id = 12345
    investor_pref.investor_pref_id = 123456
    assert investor_pref.save
  end
end
