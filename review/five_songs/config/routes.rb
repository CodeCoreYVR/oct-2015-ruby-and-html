Rails.application.routes.draw do
  root "songs#index"
  resources :albums, only: [:index, :show] do
    resources :songs
  end
end
