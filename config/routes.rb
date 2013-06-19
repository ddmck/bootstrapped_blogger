Blogger2::Application.routes.draw do

  resources :tags

  resources :authors
  resources :author_sessions, only: [ :new, :create, :destroy ]

  match 'login' => "author_sessions#new"
  match 'logout' => "author_sessions#destroy"

  resources :articles do
    resources :comments
  end

  root to: "articles#index"

end
