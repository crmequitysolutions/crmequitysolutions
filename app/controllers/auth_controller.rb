# Authored by: Mitchell Berger, Talha Koc, and Noah Over for COMPSCI 408 at Duke University for Tori Patterson

class AuthController < ApplicationController
  def is_signed_in?
    if user_signed_in?
      render :json => {"signed_in" => true, "user" => current_user}.to_json()
    else
      render :json => {"signed_in" => false}.to_json()
    end
 
  end
end