Rails.application.routes.draw do
  root 'posts#index'
  get 'archive', to: 'posts#archive', as: 'archive'
  get 'unpublished', to: 'posts#unpublished', as: 'unpublished'
  resources :posts
end
