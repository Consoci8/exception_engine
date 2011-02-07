class ExceptionsController < ApplicationController
  def index
    @exceptions = ExceptionEngine::Data.all
  end
end
