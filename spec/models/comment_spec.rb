require 'spec_helper'
require 'factories.rb'

describe Comment do
  before (:all) do
    @post = Factory(:post)
  end

  it "should create comment" do
    @comment = Comment.new(:post_id => @post.id, :body => "test")
    @comment.save
    @comment.should be_valid
  end

  it "should deny empty comments" do
    @comment = Comment.new(:post_id => @post.id)
    @comment.save
    @comment.should_not be_valid
  end

end
