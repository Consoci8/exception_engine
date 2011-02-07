module ExceptionEngine
  class ExceptionMiddleware
    def initialize(app)
      @app = app
    end
    
    def call(env)
      begin
        response = @app.call(env)
      rescue Exception => raised
        ExceptionEngine::Data.store!(raised)
        raise
      end

      if env['rack.exception']
        ExceptionEngine::Data.store!(raised)
      end
      response
    end
  end
end
