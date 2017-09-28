json.extract! rental_unit, :id, :rental_unit_id, :property_id, :bd_rms, :ba_rms, :rent, :occupied_ind, :pay_heat_ind, :pay_wtr_ind, :pay_gas_ind, :pay_elec_ind, :tenant, :created_at, :updated_at
json.url rental_unit_url(rental_unit, format: :json)
