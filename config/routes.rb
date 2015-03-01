Rails.application.routes.draw do
  root 'posts#index'
  get 'archive', to: 'posts#archive', as: 'archive'
  get 'unpublished', to: 'posts#unpublished', as: 'unpublished'
  get 'feed', to: 'posts#feed', as: 'feed'
  resources :posts
  resources :images
end
