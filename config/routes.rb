RailsFramework::Application.routes.draw do
  root :to => 'session#splash'
  resources :subscribers, :only=> [:index,:new,:create] do
    collection do
      post :purchase
    end
  end
  resources :users, :only => [:index, :new, :create]

  get '/login' => 'session#new'

  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'


end
