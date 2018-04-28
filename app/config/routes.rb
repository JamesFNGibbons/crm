Rails.application.routes.draw do
  
  # Default root
  root 'index#index'
  
  # Auth routes
  get '/auth' => 'auth#index'
  get '/auth/login' => 'auth#login'
  get '/auth/register' => 'auth#register'
  get '/auth/logout' => 'auth#logout'
  get '/auth/do-login' => 'auth#do_login'
  get '/auth/do-register' => 'auth#do_register'
  
  # Clients routes
  get '/clients' => 'clients#index'
  get '/clients/add-new' => 'clients#add_new'
  get '/clients/do-add-new' => 'clients#do_add_new'
end
