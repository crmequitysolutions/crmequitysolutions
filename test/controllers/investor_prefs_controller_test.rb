require 'test_helper'

class InvestorPrefsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @investor_pref = investor_prefs(:one)
  end

  test "should get index" do
    get investor_prefs_url
    assert_response :success
  end

  test "should get new" do
    get new_investor_pref_url
    assert_response :success
  end

  test "should create investor_pref" do
    assert_difference('InvestorPref.count') do
      post investor_prefs_url, params: { investor_pref: { ba_rms: @investor_pref.ba_rms, bd_rms: @investor_pref.bd_rms, community_id: @investor_pref.community_id, contact_id: @investor_pref.contact_id, investor_pref_id: @investor_pref.investor_pref_id, main_st_ind: @investor_pref.main_st_ind, max: @investor_pref.max, min: @investor_pref.min, property_type: @investor_pref.property_type, rehab_ind: @investor_pref.rehab_ind, zip_code: @investor_pref.zip_code } }
    end

    assert_redirected_to investor_pref_url(InvestorPref.last)
  end

  test "should show investor_pref" do
    get investor_pref_url(@investor_pref)
    assert_response :success
  end

  test "should get edit" do
    get edit_investor_pref_url(@investor_pref)
    assert_response :success
  end

  test "should update investor_pref" do
    patch investor_pref_url(@investor_pref), params: { investor_pref: { ba_rms: @investor_pref.ba_rms, bd_rms: @investor_pref.bd_rms, community_id: @investor_pref.community_id, contact_id: @investor_pref.contact_id, investor_pref_id: @investor_pref.investor_pref_id, main_st_ind: @investor_pref.main_st_ind, max: @investor_pref.max, min: @investor_pref.min, property_type: @investor_pref.property_type, rehab_ind: @investor_pref.rehab_ind, zip_code: @investor_pref.zip_code } }
    assert_redirected_to investor_pref_url(@investor_pref)
  end

  test "should destroy investor_pref" do
    assert_difference('InvestorPref.count', -1) do
      delete investor_pref_url(@investor_pref)
    end

    assert_redirected_to investor_prefs_url
  end
end
