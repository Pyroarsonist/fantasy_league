Rails.application.routes.draw do
  resources :matches
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'matches#index' # matches to index
  get 'matches/index'
end
