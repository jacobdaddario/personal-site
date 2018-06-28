Rails.application.routes.draw do
  root to: 'static_pages#home'
  get "/info", to: 'static_pages#info'
end
