StickersServer::Application.routes.draw do
  resources :locations

  root :to => 'static_pages#home'
end
