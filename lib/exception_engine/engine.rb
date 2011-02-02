module ExceptionEngine
  class Engine < Rails::Engine
    config.app_middleware.use "ExceptionEngine::ExceptionMiddleware"
  end
end