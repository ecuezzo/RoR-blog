Blog::Application.routes.draw do
resources :posts, :controller => 'home'
devise_for :admins

  root :to => 'home#index'
end
