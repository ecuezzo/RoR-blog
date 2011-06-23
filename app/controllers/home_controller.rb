class HomeController < ApplicationController
  before_filter :authenticate_admin!, :except => [:index, :show, :create_comment]

  def index
    @posts_count = Post.count
    @posts  = Post.order(:updated_at).page(params[:page])
    respond_to do |format|
      format.html
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    respond_to do |format|
      format.html
    end
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html
    end
  end

  def edit
       @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])
    flash[:notice] = "create called (debug)"
    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post, :notice => 'Post was successfully created.') }
        format.js {}
      else
        format.html { render :action => "new" }
        #format.js {}
      end
    end
  end


  def create_comment
  @comment = Comment.new(params[:comment])
  respond_to do |format|
    if @comment.save
      logger.info("comment save ok")
     # format.html { redirect_to :back }
      format.js {}
    else
      logger.info("comment save fail")
      redirect_to posts_path
    end
    end
  end

  def destroy_comment
    @comment = Comment.find(params[:comment_id])
    @comment.destroy

    redirect_to :back
  end

  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
    end
  end
end