Blog::Application.routes.draw do
  resources :posts, :controller => 'home'
  #match '/post/:name', :to => 'home#show', :as => 'post'
  #match "/posts/:name" => redirect("/post/%{name}")
  #match '/post/:name/edit', :to => 'home#edit', :as => 'post_edit'

  root :to => 'home#index'
end
