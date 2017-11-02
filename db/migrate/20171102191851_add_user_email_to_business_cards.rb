class AddUserEmailToBusinessCards < ActiveRecord::Migration[5.1]
  def change
    add_column :business_cards, :user_email, :string
  end
end
