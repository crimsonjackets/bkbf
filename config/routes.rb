Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'home#index'
  # TODO: remove if not need
  # get 'gofrocarton' => 'materials#gofrocarton'
  get 'contacts' => 'contacts#index'

  namespace :admin do
    root 'slides#index'
    resources :slides
    resources :pages
  end

  get ':page_name' => 'pages#show'
end
