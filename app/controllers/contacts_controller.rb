class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :check_address, only: [:new]
  

  # GET /contacts
  # GET /contacts.json
  def index
    @q = Contact.ransack(params[:q])
    @contacts = @q.result(distinct: true)
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    Business.where(["prim_contact_id = ?", @contact.contact_id]).each do |business|
      business.destroy
    end
    Business.where(["sec_contact_id = ?", @contact.contact_id]).each do |business|
      business.destroy
    end
    Interaction.where(["contact_id = ?", @contact.contact_id]).each do |interaction|
      interaction.destroy
    end
    InvestorPref.where(["contact_id = ?", @contact.contact_id]).each do |investor_pref|
      investor_pref.destroy
    end
    Property.where(["owner = ?", @contact.contact_id]).each do |property|
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
    RentalUnit.where(["tenant = ?", @contact.contact_id]).each do |rental_unit|
      rental_unit.destroy
    end
    Transaction.where(["purchased_by = ?", @contact.contact_id]).each do |transaction|
      transaction.destroy
    end
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end
    
    def check_address
      unless Address.all.size > 0
        flash[:error] = "You need an address first!"
        redirect_to new_address_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:contact_id, :address_id, :first_name, :middle_name, :last_name, :phone, :phone_ext, :alt_phone, :alt_ext, :fax, :email, :contact_type)
    end
end
