Blogger2::Application.routes.draw do

  resources :tags

  resources :articles do
    resources :comments
  end

  root to: "articles#index"

end
