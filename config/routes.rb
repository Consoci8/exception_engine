Rails.application.routes.draw do
  resources :exceptions, :only => [:index, :destroy]
end