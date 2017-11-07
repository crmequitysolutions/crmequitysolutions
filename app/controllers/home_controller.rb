class HomeController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @q = Contact.where(["user_email = ?", current_user.email]).ransack(params[:q])
        @contacts = @q.result(distinct: true)
        @q2 = Property.where(["user_email = ?", current_user.email]).ransack(params[:q])
        @properties = @q2.result(distinct: true)
    end
    
    def search
      index
      render :index
    end
    
end