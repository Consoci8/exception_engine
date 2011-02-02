module ExceptionEngine
  class ExceptionMiddleware
    def initialize(app)
      @app = app
    end
    
    def call(env)
      begin
        response = @app.call(env)
      rescue Exception => raised
        # TODO - Capture rails app raised error
        raise
      end

      if env['rack.exception']
        # TODO - Capture rack exception error
      end

      response
      
    end
  end
end
