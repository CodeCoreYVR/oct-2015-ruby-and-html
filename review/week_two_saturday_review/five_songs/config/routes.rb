Rails.application.routes.draw do
  root "songs#index"

  resources :songs, only: [:new]
end
