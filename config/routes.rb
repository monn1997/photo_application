Rails.application.routes.draw do
  root 'blogs#index'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :favorites, only: [:create, :destroy, :index]
  resources :blogs do
    collection do
      post :confirm
    end
  end
end
