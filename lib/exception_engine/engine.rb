module ExceptionEngine
  class Engine < Rails::Engine
    
    config.app_middleware.use "ExceptionEngine::ExceptionMiddleware"
    
    # Make configurations proxy to ExceptionEngine
    config.exception_engine = ExceptionEngine
  end
end