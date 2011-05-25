require 'spec_helper'

describe "LayoutLinks" do

   it "should have a Home page at '/'" do
     get root_url
     response.should be_success
   end

end