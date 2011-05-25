class HomeController < ApplicationController
  def index
    @post= Post.all
  end

  def show
    @current_post = Post.find_by_title(params[:name])
  end

end
