require 'digest/md5'

class AuthController < ApplicationController
  
  def index
    if(session[:loggedin])
      redirect_to('/');
    else
      redirect_to(:action => 'login');
    end
  end
  
  def login
    if(session[:loggedin])
      redirect_to(:controller => 'dash', :action => 'index');
    end
    @login_error = (params[:error] == 'true')
  end
  
  def logout
    if(session[:loggedin])
      session[:loggedin] = false;
    end
    redirect_to('/');
  end
  
  def do_register
    if(session[:loggedin])
      redirect_to('/');
    else
      # Check if the email is in use
      if(Users.where(email:params[:email]).count > 0)
        redirect_to('/auth/register?email_used=true');
      else
        # Create the new user object
        user = Users.new
        user.name = params[:name];
        user.email = params[:email];
        user.phone = params[:phone];
        user.business = params[:business];

        # Hash the password & save the user
        user.password = Digest::MD5.hexdigest(params[:password]);
        user.save();
  
        # Send the new user a welcome email
        UserMailer.welcome_email(user).deliver
        
        # Log the new user in for the first time.
        session[:loggedin] = true;
        session[:user_id] = user.id;

        redirect_to('/');
      end
    end
  end
  
  def do_login 
    if(session[:loggedin])
      redirect_to(:controller => 'dash', :action => 'index');
    else
      if(params[:username] && params[:password])
        password = Digest::MD5.hexdigest(params[:password]);
        user = Users.where(
          email: params[:username],
          password: password
        );
        if(user.count > 0)
          session[:loggedin] = true;
          session[:user_id] = user.first.id
          redirect_to('/')
        else
         
          # Check if the user has an account with us
          query = Users.where(email: params[:username]);
          if(query.count > 0)
            UserMailer.with(email: params[:username]).bad_login_attempt.deliver_now
          end
          
          redirect_to('/auth/login?error=true')
        end
      end
    end
  end
  
  def register
    render :template => 'auth/reg'
  end
       
end
