Rails.application.routes.draw do
  root 'albums#index'

  resources :albums, only: %i[index]
end
