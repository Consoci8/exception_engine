module ExceptionEngine
  class Engine < Rails::Engine
    initializer "exception_engine.add_middleware" do |app|
      app.middleware.use ExceptionEngine::ExceptionMiddleware
    end
    # config.app_middleware.use "ExceptionEngine::ExceptionMiddleware"
  end
end