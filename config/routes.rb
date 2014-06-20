Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'home#index'
  get 'gofrocarton' => 'materials#gofrocarton'
  get 'contacts' => 'contacts#index'

  namespace :admin do
    root 'slides#index'
    resources :slides
    resources :pages
  end
end
