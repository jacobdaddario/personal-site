Rails.application.routes.draw do
  root                to: 'static_pages#home'
  get     '/contact', to: 'static_pages#contact'
  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'

  # This route sets up the pdfjs viewer
  mount PdfjsViewer::Rails::Engine => "/pdfjs", as: 'pdfjs'
end
