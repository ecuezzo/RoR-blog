require 'spec_helper'
require 'factories.rb'

describe Post do
  before(:all) do
    @post= Factory.build(:post)
    @post.save
  end

  it "should not create post with empty title" do
    post = Post.new(:title => "", :body => "example")
    post.save
    post.should_not be_valid
  end

  it "should not create post with empty body" do
    @post.update_attributes(:title => "hello", :body => "")
    @post.should_not be_valid
  end

  it "should create  valid post" do
    @post.update_attributes(:title => "hello", :body => "hello pretty world!11")
    @post.should be_valid
  end

  after(:all) do
    @post.delete
  end

end

