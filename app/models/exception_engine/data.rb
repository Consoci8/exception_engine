module ExceptionEngine
  class Data
    include Mongoid::Document
    
    field :error_class
    field :error_message
    embeds_many :backtraces, :class_name => "ExceptionEngine::BacktraceData"
    field :created_at, :type => Time
    
    def self.store!(args)
      data = new
      data.parse(args)
      data.save!
    end
    
    def parse(notice)
      self.error_class = notice.error_class 
      self.error_message = notice.error_message
      if !notice.backtrace.lines.empty?
        notice.backtrace.lines.each do | line | 
          if !line.nil?
            b             = ExceptionEngine::BacktraceData.new
            b.line_num    = line.number
            b.file        = line.file
            b.ruby_method = line.method
            self.backtraces << b
          end
        end
      end
      self.created_at = Time.now.utc
    end
  end
end
