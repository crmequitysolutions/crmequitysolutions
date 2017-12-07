require 'test_helper'
include Warden::Test::Helpers

class TemplateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "validates uniqueness of title" do
    @david = User.create(email: "david@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))
    login_as(@david)
    template = Template.new
    template.title = "New Template"
    template.text = "HI"
    template.save
    template = Template.new
    template.title = "New Template"
    template.text = "HI"
    assert_not template.save
    template.title = "Template 2"
    assert template.save
  end
  
  test "validates presence of required fields" do
    @david = User.create(email: "david@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))
    login_as(@david)
    template = Template.new
    template.text = "HI"
    assert_not template.save
    template = Template.new
    template.title = "New Template"
    assert_not template.save
    template = Template.new
    template.title = "New Template"
    template.text = "HI"
    assert template.save
  end
end
