Rails.application.routes.draw do
  #The root/welcome rout
  root 'sessions#new'

  #login in and out
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  #Signup
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'









	# resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
