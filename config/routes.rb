Blog::Application.routes.draw do
devise_for :admins
resources :posts, :controller => 'home'

match 'posts/:id' => 'home#create_comment', :method => :post

root :to => 'home#index'

end
