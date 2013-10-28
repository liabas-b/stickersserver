StickersServer::Application.routes.draw do
  resources :sticker_configurations

  match '/last_location', :to => "locations#last_location"
  match '/web_sockets', :to => "static_pages#web_sockets", as: 'web_sockets'

  resources :locations

  root :to => 'static_pages#home'
end
