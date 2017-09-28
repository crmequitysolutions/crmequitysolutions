require 'test_helper'

class RentalUnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rental_unit = rental_units(:one)
  end

  test "should get index" do
    get rental_units_url
    assert_response :success
  end

  test "should get new" do
    get new_rental_unit_url
    assert_response :success
  end

  test "should create rental_unit" do
    assert_difference('RentalUnit.count') do
      post rental_units_url, params: { rental_unit: { ba_rms: @rental_unit.ba_rms, bd_rms: @rental_unit.bd_rms, occupied_ind: @rental_unit.occupied_ind, pay_elec_ind: @rental_unit.pay_elec_ind, pay_gas_ind: @rental_unit.pay_gas_ind, pay_heat_ind: @rental_unit.pay_heat_ind, pay_wtr_ind: @rental_unit.pay_wtr_ind, property_id: @rental_unit.property_id, rent: @rental_unit.rent, rental_unit_id: @rental_unit.rental_unit_id, tenant: @rental_unit.tenant } }
    end

    assert_redirected_to rental_unit_url(RentalUnit.last)
  end

  test "should show rental_unit" do
    get rental_unit_url(@rental_unit)
    assert_response :success
  end

  test "should get edit" do
    get edit_rental_unit_url(@rental_unit)
    assert_response :success
  end

  test "should update rental_unit" do
    patch rental_unit_url(@rental_unit), params: { rental_unit: { ba_rms: @rental_unit.ba_rms, bd_rms: @rental_unit.bd_rms, occupied_ind: @rental_unit.occupied_ind, pay_elec_ind: @rental_unit.pay_elec_ind, pay_gas_ind: @rental_unit.pay_gas_ind, pay_heat_ind: @rental_unit.pay_heat_ind, pay_wtr_ind: @rental_unit.pay_wtr_ind, property_id: @rental_unit.property_id, rent: @rental_unit.rent, rental_unit_id: @rental_unit.rental_unit_id, tenant: @rental_unit.tenant } }
    assert_redirected_to rental_unit_url(@rental_unit)
  end

  test "should destroy rental_unit" do
    assert_difference('RentalUnit.count', -1) do
      delete rental_unit_url(@rental_unit)
    end

    assert_redirected_to rental_units_url
  end
end
