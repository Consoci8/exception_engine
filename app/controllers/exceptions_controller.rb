class ExceptionsController < ApplicationController
  before_filter :exception_engine_authentication
  
  def index
    @exceptions = ExceptionEngine::Data.all.descending(:created_at)
  end
end
