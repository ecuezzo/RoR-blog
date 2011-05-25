Blog::Application.routes.draw do
  match '/post/:name', :to => 'home#show', :as => 'post'
  match "/posts/:name" => redirect("/post/%{name}")

  root :to => 'home#index'
end
