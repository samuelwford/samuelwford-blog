Rails.application.routes.draw do
  root 'posts#index'
  
  get 'archive', to: 'posts#archive', as: 'archive'
  get 'unpublished', to: 'posts#unpublished', as: 'unpublished'
  get 'feed', to: 'posts#feed', as: 'feed'
  
  resources :posts
  resources :images
  
  get 'game-friends', to: 'apps#game_friends', as: :game_friends
  get 'the-fox-and-the-grapes', to: 'apps#the_fox_and_the_grapes', as: :the_fox_and_the_grapes
  get 'rename-finder-items-action', to: 'apps#rename_finder_items_action', as: :rename_finder_items_action
  get 'snippose', to: 'apps#snippose', as: :snippose
end
