require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "validates uniqueness of transaction id" do
    @david = User.create(email: "david@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))
    login_as(@david)
    transaction = Transaction.new
    transaction.property_id = 12345
    transaction.purchased_by = 12345
    transaction.price = 1000000
    transaction.transaction_id = 12345
    transaction.save
    transaction = Transaction.new
    transaction.property_id = 12345
    transaction.purchased_by = 12345
    transaction.price = 1000000
    transaction.transaction_id = 12345
    assert_not transaction.save
    transaction.transaction_id = 123456
    assert transaction.save
  end
  
  test "validates presence of required fields" do
    @david = User.create(email: "david@mail.com", password: Devise::Encryptor.digest(User, "helloworld"))
    login_as(@david)
    transaction = Transaction.new
    transaction.purchased_by = 12345
    transaction.price = 1000000
    transaction.transaction_id = 12345
    assert_not transaction.save
    transaction = Transaction.new
    transaction.property_id = 12345
    transaction.price = 1000000
    transaction.transaction_id = 123457
    assert_not transaction.save
    transaction = Transaction.new
    transaction.property_id = 12345
    transaction.purchased_by = 12345
    transaction.transaction_id = 123456
    assert_not transaction.save
    transaction = Transaction.new
    transaction.property_id = 12345
    transaction.purchased_by = 12345
    transaction.price = 1000000
    assert_not transaction.save
    transaction = Transaction.new
    transaction.property_id = 12345
    transaction.purchased_by = 12345
    transaction.price = 1000000
    transaction.transaction_id = 123458
    assert transaction.save
  end
end
