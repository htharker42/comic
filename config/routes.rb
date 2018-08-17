Rails.application.routes.draw do
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :comics do
  member do
    get :toggle_status
  end
end

root to: 'pages#home'

get'/about', to: 'pages#about'

get '/contact', to: 'pages#contact'

get '/news', to: 'pages#news'

get '/archive', to: 'pages#archive'

end
