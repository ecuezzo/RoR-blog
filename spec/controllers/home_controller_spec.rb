require 'spec_helper'

describe HomeController do
  render_views
  before(:all) do
#    @post = Factory.build(:post)
#    @post.save

  end

    it "should be posts on index page" do
      post = Factory(:post)
      visit root_url
      page.should have_content(post.title)
    end

  after(:all) do
#    @post.delete
  end

end
