# Authored by: Mitchell Berger, Talha Koc, and Noah Over for COMPSCI 408 at Duke University for Tori Patterson

class InvestorPrefsController < ApplicationController
  before_action :set_investor_pref, only: [:show, :edit, :update, :destroy]
  before_action :check_contact, only: [:new]
  before_action :authenticate_user!

  # GET /investor_prefs
  # GET /investor_prefs.json
  def index
    @q = InvestorPref.where(["user_email = ?", current_user.email]).ransack(params[:q])
    @investor_prefs = @q.result(distinct: true)
  end

  # GET /investor_prefs/1
  # GET /investor_prefs/1.json
  def show
  end

  # GET /investor_prefs/new
  def new
    @investor_pref = InvestorPref.new
  end

  # GET /investor_prefs/1/edit
  def edit
  end
  
  def properties
    @investor_pref = InvestorPref.where(["investor_pref_id = ? and user_email = ?", params[:id], current_user.email]).first
    @addresses = Address.where(["zip_code = ? and community_id = ? and user_email = ?", @investor_pref.zip_code, @investor_pref.community_id, current_user.email]).pluck(:address_id)
    @temp = Property.where(["property_type = ? and bd_rms = ? and ba_rms = ? and quick_close_amt < ? and quick_close_amt > ? and user_email = ?", @investor_pref.property_type, @investor_pref.bd_rms, 
      @investor_pref.ba_rms, @investor_pref.max, @investor_pref.min, current_user.email
    ])
    @q = @temp.where({ address_id: @addresses }).ransack(params[:q])
    @properties = @q.result(distinct: true)
  end

  # POST /investor_prefs
  # POST /investor_prefs.json
  def create
    @investor_pref = InvestorPref.new(investor_pref_params)
    @num = 1
    while InvestorPref.where(["investor_pref_id = ?", @num]).size > 0
      @num = @num + 1
    end
    @investor_pref.investor_pref_id = @num
    @investor_pref.user_email = current_user.email
    respond_to do |format|
      if @investor_pref.save
        format.html { redirect_to home_path, notice: 'Investor preference was successfully created.' }
        format.json { render :show, status: :created, location: @investor_pref }
      else
        format.html { redirect_to home_path, alert: 'Investor preference failed to be created.' }
        format.json { render json: @investor_pref.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /investor_prefs/1
  # PATCH/PUT /investor_prefs/1.json
  def update
    respond_to do |format|
      if @investor_pref.update(investor_pref_params)
        format.html { redirect_to home_path, notice: 'Investor preference was successfully updated.' }
        format.json { render :show, status: :ok, location: @investor_pref }
      else
        format.html { redirect_to home_path, alert: 'Investor preference failed to update.' }
        format.json { render json: @investor_pref.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /investor_prefs/1
  # DELETE /investor_prefs/1.json
  def destroy
    @investor_pref.destroy
    respond_to do |format|
      format.html { redirect_to home_path, notice: 'Investor pref was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_investor_pref
      @investor_pref = InvestorPref.find(params[:id])
    end
    
    def check_contact
      unless Contact.where(["user_email = ?", current_user.email]).size > 0
        flash[:error] = "You need a contact first!"
        redirect_to new_contact_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def investor_pref_params
      params.require(:investor_pref).permit(:investor_pref_id, :contact_id, :zip_code, :community_id, :property_type, :bd_rms, :ba_rms, :max, :min, :rehab_ind, :main_st_ind)
    end
end
