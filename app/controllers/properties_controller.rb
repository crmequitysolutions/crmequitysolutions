class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  # GET /properties
  # GET /properties.json
  def index
    @properties = Property.order(:property_id)
  end
  
  def update_order
    @properties = Property.order(params[:column_name])
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties
  # POST /properties.json
  def create
    @property = Property.new(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params.require(:property).permit(:property_id, :address_id, :owner, :property_type, :time_on_mrkt, :construction, :basement_ind, :public_water_ind, :offstreet_parking_ind, :main_st_ind, :garage_ind, :sqft, :yr_built, :bd_rms, :ba_rms, :rooms, :kitch_reno_date, :bath_reno_date, :roof_type, :roof_age, :roof_leaks_ind, :plumb_type, :plumb_age, :plumb_leak_ind, :foundation, :heat_type, :heat_age, :heat_works, :cool_type, :cool_age, :cool_works, :window_type, :window_nbr, :resn_to_sell, :agnt_list_ind, :agnt_exp_date, :quick_close_amt, :amt_owed, :pymnt_crnt, :pymt_amt, :tax_inc_ind, :interest_rate, :pymnt_asum_ind, :sell_by_date, :bck_tx_ind, :bkd_tx_amt)
    end
end
