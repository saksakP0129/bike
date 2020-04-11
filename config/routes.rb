Rails.application.routes.draw do
  devise_for :user
  root "posts#index"
  resources :users, only: [:edit, :update, :create]
  namespace :diaries do
    resources :searches, only: :index
  end
  resources :diaries, only: [:index,:new, :create] do
    post 'diaries_searches/:id' => 'diaries_searches#index'
    # collection do
    #   get 'search'
    # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
end

