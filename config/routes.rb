Rails.application.routes.draw do
  root to: 'static_pages#home'
  get "/contact", to: 'static_pages#contact'

  # This route sets up the pdfjs viewer
  mount PdfjsViewer::Rails::Engine => "/pdfjs", as: 'pdfjs'
end
