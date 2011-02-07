module ExceptionEngine
  class Data
    include Mongoid::Document
    
    field :log, :type => String
    field :created_at, :type => Time
    
    def self.store!(args)
      data = new
      data.parse(args)
      data.save!
    end
    
    def parse(args)
      self.log = args if !args.blank?
      self.created_at = Time.now.utc
    end
  end
end
