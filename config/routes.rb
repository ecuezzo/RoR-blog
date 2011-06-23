Blog::Application.routes.draw do
devise_for :admins
resources :posts, :controller => 'home'

match 'posts/:id' => 'home#create_comment', :method => :post
match 'posts/:id/:comment_id/delete' => 'home#destroy_comment'

root :to => 'home#index'

end
