class Property < ApplicationRecord
    validate :not_negative
    validates_presence_of :address_id, :owner, :property_id, :user_email
    validates_uniqueness_of :property_id
    reverse_geocoded_by :latitude, :longitude
    after_validation :reverse_geocode
    
    def not_negative
        errors.add(:sqft, "Sqft must be nonnegative") if
            !sqft.blank? and sqft < 0
        errors.add(:yr_built, "Yr built must be nonnegative") if
            !yr_built.blank? and yr_built < 0
        errors.add(:bd_rms, "Bd rms must be nonnegative") if
            !bd_rms.blank? and bd_rms < 0
        errors.add(:ba_rms, "Ba rms must be nonnegative") if
            !ba_rms.blank? and ba_rms < 0
        errors.add(:rooms, "Rooms must be nonnegative") if
            !rooms.blank? and rooms < 0
        errors.add(:yr_built, "Yr built must be nonnegative") if
            !yr_built.blank? and yr_built < 0
        errors.add(:window_nbr, "Window nbr must be nonnegative") if
            !window_nbr.blank? and window_nbr < 0
        errors.add(:quick_close_amt, "Quick close amt must be nonnegative") if
            !quick_close_amt.blank? and quick_close_amt < 0
        errors.add(:amt_owed, "Amt owed must be nonnegative") if
            !amt_owed.blank? and amt_owed < 0
        errors.add(:yr_built, "Yr built must be nonnegative") if
            !yr_built.blank? and yr_built < 0
        errors.add(:pymt_amt, "Pymt amt must be nonnegative") if
            !pymt_amt.blank? and pymt_amt < 0
        errors.add(:interest_rate, "Interest rate must be nonnegative") if
            !interest_rate.blank? and interest_rate < 0
        errors.add(:bkd_tx_amt, "Bkd tx amt must be nonnegative") if
            !bkd_tx_amt.blank? and bkd_tx_amt < 0
    end
end
