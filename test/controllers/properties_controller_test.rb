require 'test_helper'

class PropertiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @property = properties(:one)
  end

  test "should get index" do
    get properties_url
    assert_response :success
  end

  test "should get new" do
    get new_property_url
    assert_response :success
  end

  test "should create property" do
    assert_difference('Property.count') do
      post properties_url, params: { property: { address_id: @property.address_id, agnt_exp_date: @property.agnt_exp_date, agnt_list_ind: @property.agnt_list_ind, amt_owed: @property.amt_owed, ba_rms: @property.ba_rms, basement_ind: @property.basement_ind, bath_reno_date: @property.bath_reno_date, bck_tx_ind: @property.bck_tx_ind, bd_rms: @property.bd_rms, bkd_tx_amt: @property.bkd_tx_amt, construction: @property.construction, cool_age: @property.cool_age, cool_type: @property.cool_type, cool_works: @property.cool_works, foundation: @property.foundation, garage_ind: @property.garage_ind, heat_age: @property.heat_age, heat_type: @property.heat_type, heat_works: @property.heat_works, interest_rate: @property.interest_rate, kitch_reno_date: @property.kitch_reno_date, main_st_ind: @property.main_st_ind, offstreet_parking_ind: @property.offstreet_parking_ind, owner: @property.owner, plumb_age: @property.plumb_age, plumb_leak_ind: @property.plumb_leak_ind, plumb_type: @property.plumb_type, property_id: @property.property_id, property_type: @property.property_type, public_water_ind: @property.public_water_ind, pymnt_asum_ind: @property.pymnt_asum_ind, pymnt_crnt: @property.pymnt_crnt, pymt_amt: @property.pymt_amt, quick_close_amt: @property.quick_close_amt, resn_to_sell: @property.resn_to_sell, roof_age: @property.roof_age, roof_leaks_ind: @property.roof_leaks_ind, roof_type: @property.roof_type, rooms: @property.rooms, sell_by_date: @property.sell_by_date, sqft: @property.sqft, tax_inc_ind: @property.tax_inc_ind, time_on_mrkt: @property.time_on_mrkt, window_nbr: @property.window_nbr, window_type: @property.window_type, yr_built: @property.yr_built } }
    end

    assert_redirected_to property_url(Property.last)
  end

  test "should show property" do
    get property_url(@property)
    assert_response :success
  end

  test "should get edit" do
    get edit_property_url(@property)
    assert_response :success
  end

  test "should update property" do
    patch property_url(@property), params: { property: { address_id: @property.address_id, agnt_exp_date: @property.agnt_exp_date, agnt_list_ind: @property.agnt_list_ind, amt_owed: @property.amt_owed, ba_rms: @property.ba_rms, basement_ind: @property.basement_ind, bath_reno_date: @property.bath_reno_date, bck_tx_ind: @property.bck_tx_ind, bd_rms: @property.bd_rms, bkd_tx_amt: @property.bkd_tx_amt, construction: @property.construction, cool_age: @property.cool_age, cool_type: @property.cool_type, cool_works: @property.cool_works, foundation: @property.foundation, garage_ind: @property.garage_ind, heat_age: @property.heat_age, heat_type: @property.heat_type, heat_works: @property.heat_works, interest_rate: @property.interest_rate, kitch_reno_date: @property.kitch_reno_date, main_st_ind: @property.main_st_ind, offstreet_parking_ind: @property.offstreet_parking_ind, owner: @property.owner, plumb_age: @property.plumb_age, plumb_leak_ind: @property.plumb_leak_ind, plumb_type: @property.plumb_type, property_id: @property.property_id, property_type: @property.property_type, public_water_ind: @property.public_water_ind, pymnt_asum_ind: @property.pymnt_asum_ind, pymnt_crnt: @property.pymnt_crnt, pymt_amt: @property.pymt_amt, quick_close_amt: @property.quick_close_amt, resn_to_sell: @property.resn_to_sell, roof_age: @property.roof_age, roof_leaks_ind: @property.roof_leaks_ind, roof_type: @property.roof_type, rooms: @property.rooms, sell_by_date: @property.sell_by_date, sqft: @property.sqft, tax_inc_ind: @property.tax_inc_ind, time_on_mrkt: @property.time_on_mrkt, window_nbr: @property.window_nbr, window_type: @property.window_type, yr_built: @property.yr_built } }
    assert_redirected_to property_url(@property)
  end

  test "should destroy property" do
    assert_difference('Property.count', -1) do
      delete property_url(@property)
    end

    assert_redirected_to properties_url
  end
end
