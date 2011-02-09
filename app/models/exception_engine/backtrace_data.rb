module ExceptionEngine
  class BacktraceData
    include Mongoid::Document
    
    field :number
    field :file
    field :ruby_method
    embedded_in :data, :inverse_of => :backtraces
  end
end