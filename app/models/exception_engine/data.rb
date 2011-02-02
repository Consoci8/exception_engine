module ExceptionEngine
  class Data
    include Mongoid::Document
    
    field :log, :type => String
    
    def self.store!(args)
      data = new
      data.parse(args)
      data.save!
    end
    
    def parse(args)
      self.log = args[0] if !args.blank?
    end
  end
end
