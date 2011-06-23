Blog::Application.routes.draw do
devise_for :admins
resources :posts, :controller => 'home'

match 'posts/:id' => 'home#create_comment', :method => :post
match 'posts/:id/:comment_id/delete' => 'home#destroy_comment'
match 'tag/:tag' => 'home#tagged_with'

root :to => 'home#index'

end
