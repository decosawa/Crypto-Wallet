class WelcomeController < ApplicationController
  def index

    cookies[:cookie] = "Ruby on Rails _ Cookie"
    session[:session] = "Ruby on Rails _ Session"

  end
end
