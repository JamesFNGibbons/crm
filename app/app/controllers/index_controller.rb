class IndexController < ApplicationController
  def index
    if(session[:loggedin])
      @user_id = session[:user_id]
      @user = Users.find(@user_id)
      
      @alerts = Alerts.where(user_id: @user.id)
      if(@alerts.count > 0)
        @alert_head = 'You have <b>' << @alerts.count << '</b> Alerts';
      else
        @alert_head = 'Nothing to see at this point in time.'
      end
    else 
      redirect_to('/auth/login')
    end
  end
  
  def dismiss_alert
    if(params[:alert_id] && session[:loggedin])
      alert = Alerts.find(params[:alert_id])
      if(alert.user_id = session[:user_id])
        alert.destroy
      end
    end
    
    redirect_to('/')
  end
end
