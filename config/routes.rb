Rails.application.routes.draw do

  #Signup
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/profile' => 'users#edit'
  patch '/profile' => 'users#update'

  #The root/welcome rout
  root 'sessions#new'

  #login in and out
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  #Notes
  get '/notes' => 'notes#index'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
