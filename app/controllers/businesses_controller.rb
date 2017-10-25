class BusinessesController < ApplicationController
  before_action :set_business, only: [:show, :edit, :update, :destroy]
  before_action :check_address, only: [:new]
  before_action :check_contact, only: [:new]

  # GET /businesses
  # GET /businesses.json
  def index
    @q = Business.ransack(params[:q])
    @businesses = @q.result(distinct: true)
  end

  # GET /businesses/1
  # GET /businesses/1.json
  def show
  end

  # GET /businesses/new
  def new
    @business = Business.new
  end

  # GET /businesses/1/edit
  def edit
  end

  # POST /businesses
  # POST /businesses.json
  def create
    @business = Business.new(business_params)
    @num = 1
    while Business.where(["business_id = ?", @num]).size > 0
      @num = Random.rand(1000000000)
    end
    @business.business_id = @num
    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Business was successfully created.' }
        format.json { render :show, status: :created, location: @business }
      else
        format.html { render :new }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /businesses/1
  # PATCH/PUT /businesses/1.json
  def update
    respond_to do |format|
      if @business.update(business_params)
        format.html { redirect_to @business, notice: 'Business was successfully updated.' }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :edit }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /businesses/1
  # DELETE /businesses/1.json
  def destroy
    @business.destroy
    respond_to do |format|
      format.html { redirect_to businesses_url, notice: 'Business was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:id])
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
    def business_params
      params.require(:business).permit(:business_id, :business_name, :address_id, :url, :email, :prim_contact_id, :sec_contact_id)
    end
end
