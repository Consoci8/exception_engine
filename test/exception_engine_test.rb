require 'test_helper'

class ExceptionMiddlewareTest < ActiveSupport::TestCase

  test "call the upstream app with the environment" do
    environment = { 'key' => 'value' }
    app = lambda { |env| ['response', {}, env] }
    stack = ExceptionEngine::ExceptionMiddleware.new(app)

    response = stack.call(environment)

    assert_equal ['response', {}, environment], response
  end

  test "deliver an exception raised while calling an upstream app" do
    
    exception = build_exception
    environment = { 'key' => 'value' }
    app = lambda do |env|
      raise exception
    end

    begin
      stack = ExceptionEngine::ExceptionMiddleware.new(app)
      stack.call(environment)
    rescue Exception => raised
      assert_equal exception, raised
    else
      flunk "Didn't raise an exception"
    end

  end
     
  test "deliver an exception in rack.exception" do
        
    exception = build_exception
    environment = { 'key' => 'value' }

    response = [200, {}, ['okay']]
    app = lambda do |env|
      env['rack.exception'] = exception
      response
    end
    stack = ExceptionEngine::ExceptionMiddleware.new(app)

    actual_response = stack.call(environment)

    assert_equal response, actual_response
      
  end

end