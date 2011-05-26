require 'spec_helper'
require 'active_support/secure_random'

describe HomeController do
  render_views

  before(:all) do
    @post = Factory(:post, :title => 'sample', :body => 'sample1')
    #@admin = Factory(:admin)
    10.times do  # >5, for kaminari test
      Factory(:post, :title => ActiveSupport::SecureRandom.hex(16), :body => ActiveSupport::SecureRandom.hex(16))
    end
    @record_count = Post.all.count

    #factory_girl can't see :admin factory at this time, strange. refactor coming.
    Admin.create!(:email => 'ecuezzo@yahoo.ca', :password => '111111')
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

    it "should login with valid credentials" do
      visit new_admin_session_path
      fill_in 'admin_email', :with => 'ecuezzo@yahoo.ca' #@admin.email
      fill_in 'admin_password', :with => '111111' #@admin.password
      click_button 'Sign in'
      page.should have_content('ecuezzo@yahoo.ca')
    end

    #oh my god! make factory_girl working and refactor this blonde logic
    it "should show edit post page after admin login" do
      click_link(@post.id.to_s + '-edit')
      page.should have_content("Edit " + @post.title)
    end

    it "should be working pagination" do
      visit root_url
      click_link('Next')
      click_link(@record_count.to_s + '-edit')
      page.should have_content("Edit")
    end

  after (:all) do
    Post.destroy_all
    Admin.destroy_all
  end

end
