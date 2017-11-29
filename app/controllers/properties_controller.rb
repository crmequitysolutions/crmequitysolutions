class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  before_action :check_address, only: [:new]
  before_action :check_contact, only: [:new]
  before_action :authenticate_user!

  # GET /properties
  # GET /properties.json
  def index
    @q = Property.where(["user_email = ?", current_user.email]).ransack(params[:q])
    @properties = @q.result(distinct: true)
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
    address = Address.where(["address_id = ? and user_email = ?", @property.address_id, current_user.email]).first
    citystate = address.city << ", " << address.state
    @data = Rubillow::PropertyDetails.deep_search_results({ :address => address.line_1, :citystatezip => citystate })
    @zillow_pref = -1
    if ZillowPref.where(["user_email = ?", current_user.email]).size > 0
      @zillow_pref = ZillowPref.where(["user_email = ?", current_user.email]).first
    end
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
  end
  
  def images
    @images = Image.where(["property_id = ? and user_email = ?", params[:id], current_user.email])
  end
  
  def investors
    @property = Property.where(["property_id = ? and user_email = ?", params[:id], current_user.email]).first
    @address = Address.where(["address_id = ? and user_email = ?", @property.address_id, current_user.email]).first
    @q = InvestorPref.where(["zip_code = ? and community_id = ? and property_type = ? and bd_rms = ? and ba_rms = ? and max > ? and min < ? and main_st_ind = ? and user_email = ?", @address.zip_code, 
      @address.community_id, @property.property_type, @property.bd_rms, @property.ba_rms, @property.quick_close_amt, @property.quick_close_amt, @property.main_st_ind, current_user.email
    ]).ransack(params[:q])
    @investor_prefs = @q.result(distinct: true)
  end
  
  def rooms
    @rooms = Room.where(["property_id = ? and user_email = ?", params[:id], current_user.email])
  end

  # POST /properties
  # POST /properties.json
  def create
    @property = Property.new(property_params)
    @num = 1
    while Property.where(["property_id = ?", @num]).size > 0
      @num = @num + 1
    end
    @property.property_id = @num
    @property.user_email = current_user.email
    @property.last_template_sent = "None Sent Yet"
    address = Address.where(["address_id = ? and user_email = ?", @property.address_id, current_user.email]).first
    citystate = address.city << ", " << address.state
    data = Rubillow::PropertyDetails.deep_search_results({ :address => address.line_1, :citystatezip => citystate })
    if data.success?
      @property.latitude = data.address[:latitude]
      @property.longitude = data.address[:longitude]
    else
      @property.latitude = -1
      @property.longitude = -1
    end
    respond_to do |format|
      if @property.save
        format.html { redirect_to home_path, notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { redirect_to home_path, alert: 'Property could not be created.' }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    @address = Address.where(["address_id = ? and user_email = ?", @property.address_id, current_user.email]).first
    @citystate = @address.city << ", " << @address.state
    @data = Rubillow::PropertyDetails.deep_search_results({ :address => @address.line_1, :citystatezip => @citystate })
    if @data.success?
      @property.latitude = @data.address[:latitude]
      @property.longitude = @data.address[:longitude]
    else
      @property.latitude = -1
      @property.longitude = -1
    end
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to home_path, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { redirect_to home_path, alert: 'Property could not be updated.' }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    Image.where(["property_id = ?", @property.property_id]).each do |image|
      image.destroy
    end
    Interaction.where(["property_id = ?", @property.property_id]).each do |interaction|
      interaction.destroy
    end
    PropDoc.where(["property_id = ?", @property.property_id]).each do |prop_doc|
      prop_doc.destroy
    end
    RentalUnit.where(["property_id = ?", @property.property_id]).each do |rental_unit|
      rental_unit.destroy
    end
    Room.where(["property_id = ?", @property.property_id]).each do |room|
      room.destroy
    end
    Transaction.where(["property_id = ?", @property.property_id]).each do |transaction|
      transaction.destroy
    end
    @property.destroy
    respond_to do |format|
      format.html { redirect_to home_path, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end
    
    def check_address
      unless Address.all.size > 0
        flash[:error] = "You need an address first!"
        redirect_to new_address_path
      end
    end
    
    def check_contact
      unless Contact.all.size > 0
        flash[:error] = "You need a contact first!"
        redirect_to new_contact_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params.require(:property).permit(:property_id, :address_id, :owner, :property_type, :time_on_mrkt, :construction, :basement_ind, :public_water_ind, :offstreet_parking_ind, :main_st_ind, :garage_ind, :sqft, :yr_built, :bd_rms, :ba_rms, :rooms, :kitch_reno_date, :bath_reno_date, :roof_type, :roof_age, :roof_leaks_ind, :plumb_type, :plumb_age, :plumb_leak_ind, :foundation, :heat_type, :heat_age, :heat_works, :cool_type, :cool_age, :cool_works, :window_type, :window_nbr, :resn_to_sell, :agnt_list_ind, :agnt_exp_date, :quick_close_amt, :amt_owed, :pymnt_crnt, :pymt_amt, :tax_inc_ind, :interest_rate, :pymnt_asum_ind, :sell_by_date, :bck_tx_ind, :bkd_tx_amt)
    end
end
