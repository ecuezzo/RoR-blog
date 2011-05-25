require 'spec_helper'

describe HomeController do
  render_views

  before(:each) do
    @post = Factory(:post, :title => 'sample', :body => 'sample1')
  end

    it "should be posts on index page" do
      visit root_url
      page.should have_content(@post.title)
    end

    it "should show page for each post" do
      visit root_url
      click_link(@post.id.to_s)
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

end
