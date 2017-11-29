class ZillowPrefsController < ApplicationController
  before_action :set_zillow_pref, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /zillow_prefs
  # GET /zillow_prefs.json
  def index
  end

  # GET /zillow_prefs/1
  # GET /zillow_prefs/1.json
  def show
  end

  # GET /zillow_prefs/new
  def new
    if ZillowPref.where(["user_email = ?", current_user.email]).size > 0
      redirect_to edit_zillow_pref_path(1)
    end
    @zillow_pref = ZillowPref.new
  end

  # GET /zillow_prefs/1/edit
  def edit
  end

  # POST /zillow_prefs
  # POST /zillow_prefs.json
  def create
    @zillow_pref = ZillowPref.new(zillow_pref_params)
    @zillow_pref.user_email = current_user.email
    respond_to do |format|
      if @zillow_pref.save
        format.html { redirect_to home_path, notice: 'Zillow pref was successfully created.' }
        format.json { render :show, status: :created, location: @zillow_pref }
      else
        format.html { render :new }
        format.json { render json: @zillow_pref.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /zillow_prefs/1
  # PATCH/PUT /zillow_prefs/1.json
  def update
    respond_to do |format|
      if @zillow_pref.update(zillow_pref_params)
        format.html { redirect_to home_path, notice: 'Zillow pref was successfully updated.' }
        format.json { render :show, status: :ok, location: @zillow_pref }
      else
        format.html { render :edit }
        format.json { render json: @zillow_pref.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zillow_prefs/1
  # DELETE /zillow_prefs/1.json
  def destroy
    @zillow_pref.destroy
    respond_to do |format|
      format.html { redirect_to home_path, notice: 'Zillow pref was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zillow_pref
      @zillow_pref = ZillowPref.where(["user_email = ?", current_user.email]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def zillow_pref_params
      params.require(:zillow_pref).permit(:user_email, :links, :last_sold_date, :last_sold_price, :tax_assessment, :tax_assessment_year, :year_built, :bathrooms, :bedrooms, :finished_square_feet, :lot_size_square_feet, :total_rooms, :use_code, :change, :change_duration, :last_updated, :local_real_estate, :percentile, :price, :region, :region_type, :rent_zestimate, :valuation_range)
    end
end
