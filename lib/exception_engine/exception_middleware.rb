module ExceptionEngine
  class ExceptionMiddleware
    def initialize(app)
      @app = app
    end
    
    def call(env)
      begin
        response = @app.call(env)
      rescue Exception => raised
        ExceptionEngine.exceptionize(raised)
        raise
      end

      if env['rack.exception']
        ExceptionEngine.exceptionize(raised)
      end
      response
    end
  end
end
