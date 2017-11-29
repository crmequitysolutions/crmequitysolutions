class TemplatesController < ApplicationController
  before_action :set_template, only: [:show, :edit, :update, :destroy]
  require 'mail'

  # GET /templates
  # GET /templates.json
  def index
    @templates = Template.where(["user_email = ?", current_user.email])
  end

  # GET /templates/1
  # GET /templates/1.json
  def show
  end

  # GET /templates/new
  def new
    @template = Template.new
  end

  # GET /templates/1/edit
  def edit
  end
  
  def prep
    @select = ""
    @properties = Property.where(["user_email = ?", current_user.email])
    @templates = Template.where(["user_email = ?", current_user.email])
    @property_ids = []
    @properties.each do |property|
      @property_ids.push(property.property_id)
    end
    @titles = []
    @templates.each do |template|
      @titles.push(template.title)
    end
  end
  
  def send_temp
    @property = Property.where(["user_email = ? and property_id = ?", current_user.email, params[:property_id]]).first
    @address = Address.where(["user_email = ? and address_id = ?", current_user.email, @property.address_id]).first
    @contact = Contact.where(["user_email = ? and contact_id = ?", current_user.email, @property.owner]).first
    person = @contact
    @template = Template.where(["user_email = ? and title = ?", current_user.email, params[:title]]).first
    content = @template.text
    @merged_content = MailMerge.merge(content,{:address => @address, :contact => @contact})
    merge = @merged_content

    options = { :address              => "smtp.gmail.com",
                :port                 => 587,
                :user_name            => 'crmequitysolutions@gmail.com',
                :password             => 'compsci408',
                :authentication       => 'plain',
                :enable_starttls_auto => true  }
    
    Mail.defaults do
      delivery_method :smtp, options
    end
    
    Mail.deliver do
           to person.email
         from 'crmequitysolutions@gmail.com'
      subject 'Property Inquiry from CRM Equity Solutions'
          html_part do
            content_type 'text/html; charset=UTF-8'
            body '<p>' << merge << '</p>'
          end
    end
    @property.last_template_sent = @template.title
    redirect_to home_path, notice: 'Email successfully sent.'
  end

  # POST /templates
  # POST /templates.json
  def create
    @template = Template.new(template_params)
    @template.user_email = current_user.email
    respond_to do |format|
      if @template.save
        format.html { redirect_to home_path, notice: 'Template was successfully created.' }
        format.json { render :show, status: :created, location: @template }
      else
        format.html { redirect_to home_path, alert: 'Template failed to be created.' }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /templates/1
  # PATCH/PUT /templates/1.json
  def update
    respond_to do |format|
      if @template.update(template_params)
        format.html { redirect_to home_path, notice: 'Template was successfully updated.' }
        format.json { render :show, status: :ok, location: @template }
      else
        format.html { redirect_to home_path, alert: 'Template failed to update.' }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /templates/1
  # DELETE /templates/1.json
  def destroy
    @template.destroy
    respond_to do |format|
      format.html { redirect_to home_path, notice: 'Template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_template
      @template = Template.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def template_params
      params.require(:template).permit(:user_email, :title, :text)
    end
end
