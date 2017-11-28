require 'test_helper'

class ZillowPrefsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @zillow_pref = zillow_prefs(:one)
  end

  test "should get index" do
    get zillow_prefs_url
    assert_response :success
  end

  test "should get new" do
    get new_zillow_pref_url
    assert_response :success
  end

  test "should create zillow_pref" do
    assert_difference('ZillowPref.count') do
      post zillow_prefs_url, params: { zillow_pref: { bathrooms: @zillow_pref.bathrooms, bedrooms: @zillow_pref.bedrooms, change: @zillow_pref.change, change_duration: @zillow_pref.change_duration, finished_square_feet: @zillow_pref.finished_square_feet, last_sold_date: @zillow_pref.last_sold_date, last_sold_price: @zillow_pref.last_sold_price, last_updated: @zillow_pref.last_updated, links: @zillow_pref.links, local_real_estate: @zillow_pref.local_real_estate, lot_size_square_feet: @zillow_pref.lot_size_square_feet, percentile: @zillow_pref.percentile, price: @zillow_pref.price, region: @zillow_pref.region, region_type: @zillow_pref.region_type, rent_zestimate: @zillow_pref.rent_zestimate, tax_assessment: @zillow_pref.tax_assessment, tax_assessment_year: @zillow_pref.tax_assessment_year, total_rooms: @zillow_pref.total_rooms, use_code: @zillow_pref.use_code, user_email: @zillow_pref.user_email, valuation_range: @zillow_pref.valuation_range, year_built: @zillow_pref.year_built } }
    end

    assert_redirected_to zillow_pref_url(ZillowPref.last)
  end

  test "should show zillow_pref" do
    get zillow_pref_url(@zillow_pref)
    assert_response :success
  end

  test "should get edit" do
    get edit_zillow_pref_url(@zillow_pref)
    assert_response :success
  end

  test "should update zillow_pref" do
    patch zillow_pref_url(@zillow_pref), params: { zillow_pref: { bathrooms: @zillow_pref.bathrooms, bedrooms: @zillow_pref.bedrooms, change: @zillow_pref.change, change_duration: @zillow_pref.change_duration, finished_square_feet: @zillow_pref.finished_square_feet, last_sold_date: @zillow_pref.last_sold_date, last_sold_price: @zillow_pref.last_sold_price, last_updated: @zillow_pref.last_updated, links: @zillow_pref.links, local_real_estate: @zillow_pref.local_real_estate, lot_size_square_feet: @zillow_pref.lot_size_square_feet, percentile: @zillow_pref.percentile, price: @zillow_pref.price, region: @zillow_pref.region, region_type: @zillow_pref.region_type, rent_zestimate: @zillow_pref.rent_zestimate, tax_assessment: @zillow_pref.tax_assessment, tax_assessment_year: @zillow_pref.tax_assessment_year, total_rooms: @zillow_pref.total_rooms, use_code: @zillow_pref.use_code, user_email: @zillow_pref.user_email, valuation_range: @zillow_pref.valuation_range, year_built: @zillow_pref.year_built } }
    assert_redirected_to zillow_pref_url(@zillow_pref)
  end

  test "should destroy zillow_pref" do
    assert_difference('ZillowPref.count', -1) do
      delete zillow_pref_url(@zillow_pref)
    end

    assert_redirected_to zillow_prefs_url
  end
end
