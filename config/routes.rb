Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destry'
  root to: 'static_pages#home'
  get "/contact", to: 'static_pages#contact'

  # This route sets up the pdfjs viewer
  mount PdfjsViewer::Rails::Engine => "/pdfjs", as: 'pdfjs'
end
