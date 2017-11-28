class CreateZillowPrefs < ActiveRecord::Migration[5.1]
  def change
    create_table :zillow_prefs do |t|
      t.string :user_email
      t.boolean :links
      t.boolean :last_sold_date
      t.boolean :last_sold_price
      t.boolean :tax_assessment
      t.boolean :tax_assessment_year
      t.boolean :year_built
      t.boolean :bathrooms
      t.boolean :bedrooms
      t.boolean :finished_square_feet
      t.boolean :lot_size_square_feet
      t.boolean :total_rooms
      t.boolean :use_code
      t.boolean :change
      t.boolean :change_duration
      t.boolean :last_updated
      t.boolean :local_real_estate
      t.boolean :percentile
      t.boolean :price
      t.boolean :region
      t.boolean :region_type
      t.boolean :rent_zestimate
      t.boolean :valuation_range

      t.timestamps
    end
  end
end
