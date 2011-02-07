require 'test_helper'

class NavigationTest < ActiveSupport::IntegrationCase
  test "can visualize the exceptions in the rails log" do
    
    # PostsController has an index with a failing constant call
    begin  
      visit "/posts"
    rescue
      # Check for exception data on the page
      visit exceptions_path
      assert_match "uninitialized constant PostsController::Post", page.body
    end
  end
end
