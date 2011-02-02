module ExceptionEngine
  class ExceptionMiddleware
    def initialize(app)
      @app = app
    end
    
    def call(env)
      begin
        response = @app.call(env)
      rescue Exception => raised
        # TODO Figure out how to cleanly store the caught exception
        raise
      end

      if env['rack.exception']
        # TODO Probably do something clever here
      end

      response
      
    end
  end
end
