require "exception_engine/engine"
require "exception_engine/exception_middleware"
require "mongoid"

# We are required to choose a database name
Mongoid.configure do |config|
  name = "exception_engine-#{Rails.env}"
  host = "localhost"
  config.master = Mongo::Connection.new.db(name)
  config.persist_in_safe_mode = false
end