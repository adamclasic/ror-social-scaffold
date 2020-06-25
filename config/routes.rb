Rails.application.routes.draw do

  root 'posts#index'

  # resources :friendships
  get 'friends', to: 'friendships#all_friends'
  get 'send_friend_request', to: 'friendships#send_request'
  get 'accept_friend_request', to: 'friendships#confirm_request'
  delete 'deny_friend_request', to: 'friendships#reject_request'
  get 'pending_requests', to: 'friendships#pending_requests'
  delete 'unfriend', to: 'friendships#unfriend'


  devise_for :users
  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
