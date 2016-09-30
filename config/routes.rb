Rails.application.routes.draw do
  #The root/welcome rout
  root 'sessions#new'
  resources :microposts

  #Signup
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  #login in and out
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  
  get '/profile' => 'users#edit'
  patch '/profile' => 'users#update'

  #Notes
  get '/notes' => 'notes#index'
  get '/notes/new' => 'notes#new', :as => :new_note
  post '/notes/new' => 'notes#create', :as => :create_note
  get '/notes/edit' => 'notes#edit', :as => :edit_note
  patch '/notes/edit' => 'notes#update', :as => :update_note
  delete '/notes/delete' => 'notes#destroy', :as => :delete_note




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
