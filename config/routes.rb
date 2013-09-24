StickersServer::Application.routes.draw do
  resources :sticker_configurations

  resources :locations

  root :to => 'static_pages#home'
end
