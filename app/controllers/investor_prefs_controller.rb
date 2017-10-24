class InvestorPrefsController < ApplicationController
  before_action :set_investor_pref, only: [:show, :edit, :update, :destroy]
  before_action :check_contact, only: [:new]
  before_action :check_community, only: [:new]

  # GET /investor_prefs
  # GET /investor_prefs.json
  def index
    @q = InvestorPref.ransack(params[:q])
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

  # POST /investor_prefs
  # POST /investor_prefs.json
  def create
    @investor_pref = InvestorPref.new(investor_pref_params)

    respond_to do |format|
      if @investor_pref.save
        format.html { redirect_to @investor_pref, notice: 'Investor pref was successfully created.' }
        format.json { render :show, status: :created, location: @investor_pref }
      else
        format.html { render :new }
        format.json { render json: @investor_pref.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /investor_prefs/1
  # PATCH/PUT /investor_prefs/1.json
  def update
    respond_to do |format|
      if @investor_pref.update(investor_pref_params)
        format.html { redirect_to @investor_pref, notice: 'Investor pref was successfully updated.' }
        format.json { render :show, status: :ok, location: @investor_pref }
      else
        format.html { render :edit }
        format.json { render json: @investor_pref.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /investor_prefs/1
  # DELETE /investor_prefs/1.json
  def destroy
    @investor_pref.destroy
    respond_to do |format|
      format.html { redirect_to investor_prefs_url, notice: 'Investor pref was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_investor_pref
      @investor_pref = InvestorPref.find(params[:id])
    end
    
    def check_contact
      unless Contact.all.size > 0
        flash[:error] = "You need a contact first!"
        redirect_to new_contact_path
      end
    end
    
    def check_community
      unless Community.all.size > 0
        flash[:error] = "You need a community first!"
        redirect_to new_community_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def investor_pref_params
      params.require(:investor_pref).permit(:investor_pref_id, :contact_id, :zip_code, :community_id, :property_type, :bd_rms, :ba_rms, :max, :min, :rehab_ind, :main_st_ind)
    end
end
