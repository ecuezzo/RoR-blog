require 'spec_helper'
require 'active_support/secure_random'

describe HomeController do
  render_views

  before(:all) do
    @post = Factory(:post, :title => 'sample', :body => 'sample1')
    10.times do  # >5, for kaminari test
      Factory(:post, :title => ActiveSupport::SecureRandom.hex(16), :body => ActiveSupport::SecureRandom.hex(16))
    end
    @record_count = Post.all.count
  end

    it "should be posts on index page" do
      visit root_url
      page.should have_content(@post.title)
    end

    it "should show page for each post" do
      visit root_url
      click_link(@post.id.to_s + '-read')
      page.should have_content(@post.title)
    end

    it "should go to main when click logo" do
      visit root_url
      click_link(@post.id.to_s)
      click_link('logo')
      page.should have_content('Welcome to my blog')
    end

    it "should show edit post page" do
      visit root_url
      click_link(@post.id.to_s + '-edit')
      page.should have_content("Edit " + @post.title)
    end

    it "should be working pagination" do
      visit root_url
      click_link('Next')
      click_link(@record_count.to_s + '-edit')
      page.should have_content("Edit")
    end

end
