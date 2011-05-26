class HomeController < ApplicationController
  # GET /posts
  # GET /posts.xml
  def index
    #@posts = Post.all
    @posts  = Post.order("updated_at").page(params[:page]).per(5)
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
#  def new
#    @post = Post.new
#
#    respond_to do |format|
#      format.html # new.html.erb
#      format.xml  { render :xml => @post }
#    end
#  end

  # GET /posts/1/edit
  def edit
    if admin_signed_in?
       @post = Post.find(params[:id])
    else
       redirect_to(root_url, :notice => 'Access denied')
    end
  end

  # POST /posts
  # POST /posts.xml
#  def create
#    @post = Post.new(params[:post])
#
#    respond_to do |format|
#      if @post.save
#        format.html { redirect_to(@post, :notice => 'Post was successfully created.') }
#        format.xml  { render :xml => @post, :status => :created, :location => @post }
#      else
#        format.html { render :action => "new" }
#        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
#      end
#    end
#  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
#  def destroy
#    @post = Post.find(params[:id])
#    @post.destroy
#
#    respond_to do |format|
#      format.html { redirect_to(posts_url) }
#      format.xml  { head :ok }
#    end
#  end
end