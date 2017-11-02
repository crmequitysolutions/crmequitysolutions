class AddUserEmailToInvestorPrefs < ActiveRecord::Migration[5.1]
  def change
    add_column :investor_prefs, :user_email, :string
  end
end
