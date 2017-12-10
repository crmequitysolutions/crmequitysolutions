require 'test_helper'
include Warden::Test::Helpers

class BusinessTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "validates email" do
    @david = User.create(email: "david@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))
    login_as(@david)
    business = Business.new
    business.business_name = "ABC Business"
    business.prim_contact_id = 12345
    business.address_id = 12345
    business.business_id = 12345
    business.email = "abcbusiness"
    assert_not business.save
    business.email = "abc@business.com"
    assert business.save
  end
  
  test "validates uniqueness of business id" do
    @david = User.create(email: "david@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))
    login_as(@david)
    business = Business.new
    business.business_name = "ABC Business"
    business.prim_contact_id = 12345
    business.address_id = 12345
    business.business_id = 12345
    business.email = "abc@business.com"
    business.save
    business = Business.new
    business.business_name = "ABC Business"
    business.prim_contact_id = 12345
    business.address_id = 12345
    business.business_id = 12345
    business.email = "abc@business.com"
    assert_not business.save
    business.business_id = 123456
    assert business.save
  end
  
  test "validates url" do
    @david = User.create(email: "david@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))
    login_as(@david)
    business = Business.new
    business.business_name = "ABC Business"
    business.prim_contact_id = 12345
    business.address_id = 12345
    business.business_id = 12345
    business.email = "abc@business.com"
    business.url = "abcbusiness"
    assert_not business.save
    business.url = "https://www.youtube.com/"
    assert business.save
  end
  
  test "validates presence of required fields" do
    @david = User.create(email: "david@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))
    login_as(@david)
    business = Business.new
    business.prim_contact_id = 12345
    business.address_id = 12345
    business.business_id = 12345
    business.email = "abc@business.com"
    assert_not business.save
    business = Business.new
    business.business_name = "ABC Business"
    business.address_id = 12345
    business.business_id = 123456
    business.email = "abc@business.com"
    assert_not business.save
    business = Business.new
    business.business_name = "ABC Business"
    business.prim_contact_id = 12345
    business.business_id = 123457
    business.email = "abc@business.com"
    assert_not business.save
    business = Business.new
    business.business_name = "ABC Business"
    business.prim_contact_id = 12345
    business.address_id = 12345
    business.email = "abc@business.com"
    assert_not business.save
    business = Business.new
    business.business_name = "ABC Business"
    business.prim_contact_id = 12345
    business.address_id = 12345
    business.business_id = 123458
    assert_not business.save
    business = Business.new
    business.business_name = "ABC Business"
    business.prim_contact_id = 12345
    business.address_id = 12345
    business.business_id = 123459
    business.email = "abc@business.com"
    assert business.save
  end
end
