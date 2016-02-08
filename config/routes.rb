Rails.application.routes.draw do
  root             'static_pages#home'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :layouts
  resources :users
  resources :microposts,          only: [:create, :destroy]
end
