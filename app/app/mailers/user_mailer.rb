class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def bad_login_attempt
    @email = params[:email];
    mail(to: @email, subject: 'Invalid Account Login')
  end
  
  def welcome_email(user)
    @user = user
    
#     # Convert the password to chars.
#     @password = String.new
#     for i in 1..@user.password.length 
#       @passowrd + '*'
#     end
    
    mail(
      to: @user.email,
      subject: 'Welcome to CRM'
    )
  end
end
