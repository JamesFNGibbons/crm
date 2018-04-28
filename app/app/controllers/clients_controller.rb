require 'Alert'

class ClientsController < ApplicationController
  
  def index
    puts 'working.';
  end  
  
  def add_new
    if(session[:loggedin])
      render :template => 'clients/add-new'
    end
  end
  
  def do_add_new 
    if(session[:loggedin])
      user_id = Users.find(session[:user_id])
      
      # Save the contact info
      info = BusinessContactInfo.new
      info.name = params[:contact_name]
      info.email = params[:contact_email]
      info.phone = params[:contact_phone]
      info.website = params[:website]
      info.notes = String.new
      info.position = params[:position]
      info.create
      
      client = Clients.new
      client.business = params[:business]
      client.contact_info = info.id
      client.website = params[:website]
      client.notes = String.new
      client.create
      
      redirect_to('/');
    end
  end
  
end
