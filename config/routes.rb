Rails.application.routes.draw do
  root to: 'static_pages#home'
  get "/contact", to: 'static_pages#contact'
end
