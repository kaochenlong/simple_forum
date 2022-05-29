Rails.application.routes.draw do
  resources :posts do
    resources :comments, shallow: true
  end

  root "posts#index"
end
