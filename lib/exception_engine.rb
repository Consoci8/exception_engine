require "mongoid"
require "exception_engine/backtrace"
require "exception_engine/notice"
require "exception_engine/exception_middleware"
require "exception_engine/engine"

# We are required to choose a database name
Mongoid.configure do |config|
  name = "exception_engine-#{Rails.env}"
  host = "localhost"
  config.master = Mongo::Connection.new.db(name)
  config.persist_in_safe_mode = false
end

module ExceptionEngine
  class << self
    
    # Stores the notice exception
    # @see ExceptionEngine.exceptionize
    # @params exception
    def exceptionize(exception, opts = {})
      notice = build_notice_for(exception, opts)
      ExceptionEngine::Data.store!(notice)
    end
       
    private
    
    def build_notice_for(exception, opts = {})
      exception = unwrap_exception(exception)  
      if exception.respond_to?(:to_hash)
        opts = opts.merge(exception.to_hash)
      else
        opts = opts.merge(:exception => exception)
      end
      Notice.new(opts)
    end
    
    def unwrap_exception(exception)
      if exception.respond_to?(:original_exception)
        exception.original_exception
      elsif exception.respond_to?(:continued_exception)
        exception.continued_exception
      else
        exception
      end
    end
    
  end
end
