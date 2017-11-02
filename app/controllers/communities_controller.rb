class CommunitiesController < ApplicationController
  before_action :set_community, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /communities
  # GET /communities.json
  def index
    @q = Community.where(["user_email = ?", current_user.email]).ransack(params[:q])
    @communities = @q.result(distinct: true)
  end

  # GET /communities/1
  # GET /communities/1.json
  def show
  end

  # GET /communities/new
  def new
    @community = Community.new
  end

  # GET /communities/1/edit
  def edit
  end

  # POST /communities
  # POST /communities.json
  def create
    @community = Community.new(community_params)
    @num = 1
    while Community.where(["community_id = ?", @num]).size > 0
      @num = @num+1
    end
    @community.community_id = @num
    @community.user_email = current_user.email
    respond_to do |format|
      if @community.save
        format.html { redirect_to @community, notice: 'Community was successfully created.' }
        format.json { render :show, status: :created, location: @community }
      else
        format.html { render :new }
        format.json { render json: @community.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /communities/1
  # PATCH/PUT /communities/1.json
  def update
    respond_to do |format|
      if @community.update(community_params)
        format.html { redirect_to @community, notice: 'Community was successfully updated.' }
        format.json { render :show, status: :ok, location: @community }
      else
        format.html { render :edit }
        format.json { render json: @community.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /communities/1
  # DELETE /communities/1.json
  def destroy
    Address.where(["community_id = ?", @community.community_id]).each do |address|
      Business.where(["address_id = ?", address.address_id]).each do |business|
        business.destroy
      end
      Contact.where(["address_id = ?", address.address_id]).each do |contact|
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
      Property.where(["address_id = ?", address.address_id]).each do |property|
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
      address.destroy
    end
    InvestorPref.where(["community_id = ?", @community.community_id]).each do |investor_pref|
      investor_pref.destroy
    end
    @community.destroy
    respond_to do |format|
      format.html { redirect_to communities_url, notice: 'Community was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_community
      @community = Community.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def community_params
      params.require(:community).permit(:community_id, :community_name, :zip_code)
    end
end
