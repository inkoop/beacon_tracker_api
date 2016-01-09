Rails.application.routes.draw do

  namespace :api do
    api version: 1, module: "v1" do
      resources :tracks, only: [:index, :create]
    end
  end
  
end
