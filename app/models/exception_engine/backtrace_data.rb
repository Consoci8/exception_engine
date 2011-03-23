module ExceptionEngine
  class BacktraceData
    include Mongoid::Document
    
    field :line_num, :type => Integer
    field :file, :type => String
    field :ruby_method, :type => String
    embedded_in :data, :inverse_of => :backtraces
  end
end