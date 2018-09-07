Rails.application.routes.draw do
  devise_for :users, path: "", path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :comics do
  member do
    get :toggle_status
  end
end

resources :blogs do
  member do
    get :toggle_status
  end
end
root to: 'pages#home'

get'/cast', to: 'pages#cast'

get '/author', to: 'pages#author'

get '/news', to: 'pages#news'

get '/archive', to: 'pages#archive'

end
