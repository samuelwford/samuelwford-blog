Rails.application.routes.draw do
  root 'posts#index'
  
  get 'archive', to: 'posts#archive', as: 'archive'
  get 'unpublished', to: 'posts#unpublished', as: 'unpublished'
  get 'feed', to: 'posts#feed', as: 'feed'
  
  resources :posts
  resources :images
  
  get 'rename-finder-items-action', to: 'apps#rename_finder_items_action', as: :rename_finder_items_action
  get 'snippose', to: 'apps#snippose', as: :snippose
  get 'mdx', to: 'apps#mdx', as: :mdx
  
end
