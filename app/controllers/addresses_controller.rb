class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /addresses
  # GET /addresses.json
  def index
    @q = Address.where(["user_email = ?", current_user.email]).ransack(params[:q])
    @addresses = @q.result(distinct: true)
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show
  end

  # GET /addresses/new
  def new
    @address = Address.new
  end

  # GET /addresses/1/edit
  def edit
  end

  # POST /addresses
  # POST /addresses.json
  def create
    @address = Address.new(address_params)
    @num = 1
    while Address.where(["address_id = ?", @num]).size > 0
      @num = @num+1
    end
    @address.address_id = @num
    @address.user_email = current_user.email
    respond_to do |format|
      if @address.save
        format.html { redirect_to addresses_path, notice: 'Address was successfully created.' }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to addresses_path, notice: 'Address was successfully updated.' }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    Business.where(["address_id = ?", @address.address_id]).each do |business|
      business.destroy
    end
    Contact.where(["address_id = ?", @address.address_id]).each do |contact|
      Business.where(["prim_contact_id = ?", contact.contact_id]).each do |business|
        business.destroy
      end
      Business.where(["sec_contact_id = ?", contact.contact_id]).each do |business|
        business.destroy
      end
      BusinessCard.where(["contact_id = ?", contact.contact_id]).each do |business_card|
        business_card.destroy
      end
      Interaction.where(["contact_id = ?", contact.contact_id]).each do |interaction|
        interaction.destroy
      end
      InvestorPref.where(["contact_id = ?", contact.contact_id]).each do |investor_pref|
        investor_pref.destroy
      end
      Property.where(["owner = ?", contact.contact_id]).each do |property|
        Image.where(["property_id = ?", property.property_id]).each do |image|
          image.destroy
        end
        Interaction.where(["property_id = ?", property.property_id]).each do |interaction|
          interaction.destroy
        end
        PropDoc.where(["property_id = ?", property.property_id]).each do |prop_doc|
          prop_doc.destroy
        end
        RentalUnit.where(["property_id = ?", property.property_id]).each do |rental_unit|
          rental_unit.destroy
        end
        Transaction.where(["property_id = ?", property.property_id]).each do |transaction|
          transaction.destroy
        end
        property.destroy
      end
      RentalUnit.where(["tenant = ?", contact.contact_id]).each do |rental_unit|
        rental_unit.destroy
      end
      Transaction.where(["purchased_by = ?", contact.contact_id]).each do |transaction|
        transaction.destroy
      end
      contact.destroy
    end
    Property.where(["address_id = ?", @address.address_id]).each do |property|
      Image.where(["property_id = ?", property.property_id]).each do |image|
        image.destroy
      end
      Interaction.where(["property_id = ?", property.property_id]).each do |interaction|
        interaction.destroy
      end
      PropDoc.where(["property_id = ?", property.property_id]).each do |prop_doc|
        prop_doc.destroy
      end
      RentalUnit.where(["property_id = ?", property.property_id]).each do |rental_unit|
        rental_unit.destroy
      end
      Transaction.where(["property_id = ?", property.property_id]).each do |transaction|
        transaction.destroy
      end
      property.destroy
    end
    @address.destroy
    respond_to do |format|
      format.html { redirect_to addresses_url, notice: 'Address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:address).permit(:address_id, :line_1, :line_2, :city, :state, :zip_code, :county, :country, :community_id, :school_district)
    end
end
