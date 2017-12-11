# Authored by: Mitchell Berger, Talha Koc, and Noah Over for COMPSCI 408 at Duke University for Tori Patterson

require 'test_helper'
include Warden::Test::Helpers

class PropDocTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "validates uniqueness of prop doc id" do
    @david = User.create(email: "david@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))
    login_as(@david)
    prop_doc = PropDoc.new
    prop_doc.prop_doc_id = 12345
    prop_doc.save
    prop_doc = PropDoc.new
    prop_doc.prop_doc_id = 12345
    assert_not prop_doc.save
    prop_doc.prop_doc_id = 123456
    assert prop_doc.save
  end
  
  test "validates presence of required fields" do
    @david = User.create(email: "david@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))
    login_as(@david)
    prop_doc = PropDoc.new
    assert_not prop_doc.save
    prop_doc = PropDoc.new
    prop_doc.prop_doc_id = 12345
    assert prop_doc.save
  end
end
