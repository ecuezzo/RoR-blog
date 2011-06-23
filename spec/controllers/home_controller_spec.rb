require 'spec_helper'
require 'active_support/secure_random'

describe HomeController do
  render_views

  before(:all) do
    #@admin = Factory(:admin)
    10.times do  # >5, for kaminari test
      Factory(:post, :title => ActiveSupport::SecureRandom.hex(16), :body => ActiveSupport::SecureRandom.hex(16))
    end
    @record_count = Post.all.count
    @post = Post.first

    #factory_girl can't see :admin factory at this time, it's strange. So, refactor is coming.
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
      click_link(Post.first.id.to_s + '-read')
      click_link('logo')
      page.should have_content('Welcome to my blog')
    end

    it "should not be edit link, if not admin" do
      visit root_url
      page.should_not have_selector("a##{@post.id.to_s}-edit")
    end

    it "should redirect from edit page to main, if not admin" do
      visit edit_post_path(@post)
      page.should have_content("Sign in")
    end

    it "should login with valid credentials" do
      visit new_admin_session_path
      fill_in 'admin_email', :with => 'ecuezzo@yahoo.ca' #@admin.email
      fill_in 'admin_password', :with => '111111' #@admin.password
      click_button 'Sign in'
      page.should have_content('ecuezzo@yahoo.ca')
    end

    #oh my god! make factory_girl working and refactor this blonde logic
    it "should edit post after admin login" do
      click_link(@post.id.to_s + '-edit')
      fill_in 'post_title', :with => ActiveSupport::SecureRandom.hex(16)
      fill_in 'post_body', :with => ActiveSupport::SecureRandom.hex(16)
      click_button 'wymupdate'
      page.should have_content('Post was successfully updated.')
    end

    it "should not edit post with invalid input" do
      #fuck devise, fuck my low experiense :-)
      visit destroy_admin_session_path
      visit new_admin_session_path
      fill_in 'admin_email', :with => 'ecuezzo@yahoo.ca' #@admin.email
      fill_in 'admin_password', :with => '111111' #@admin.password
      click_button 'Sign in'

      click_link(@post.id.to_s + '-edit')
      fill_in 'post_title', :with => ActiveSupport::SecureRandom.hex(16)
      fill_in 'post_body', :with => nil
      click_button 'wymupdate'
      page.should have_no_content('Post was successfully updated.')
    end

    it "should create new post, if logged in" do
      #fuck devise, fuck my low experiense :-)
      visit destroy_admin_session_path
      visit new_admin_session_path
      fill_in 'admin_email', :with => 'ecuezzo@yahoo.ca' #@admin.email
      fill_in 'admin_password', :with => '111111' #@admin.password
      click_button 'Sign in'

      #click_link('new_post')
      visit new_post_path

      fill_in 'post_title', :with => ActiveSupport::SecureRandom.hex(16)
      fill_in 'post_body', :with => ActiveSupport::SecureRandom.hex(16)
      click_button 'wymupdate'
      page.should have_content('Post was successfully created.')
    end

    it "should be working pagination" do
      visit root_url
      click_link('Older')
      click_link(@record_count.to_s + '-edit')
      page.should have_content('Edit')
    end

    it "should post comment" do
#      visit root_url
#      click_link(@post.id.to_s + '-read')
#      fill_in 'comment_body', :with => 'it is awesome post, thanks'
#      click_button 'comment_submit'
#      page.should have_content('it is awesome post, thanks')
      pending "js support in tests"
    end

  after (:all) do
    Post.destroy_all
    Admin.destroy_all
  end

end
