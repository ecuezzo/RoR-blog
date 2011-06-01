Blog::Application.routes.draw do
devise_for :admins
resources :posts, :controller => 'home'

root :to => 'home#index'

end
