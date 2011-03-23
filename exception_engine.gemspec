# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "exception_engine/version"

Gem::Specification.new do |s|
  s.name = "exception_engine"
  s.summary = "A rails engine that logs your Rails exceptions"
  s.description = "The Exception Engine logs your Rails exceptions in your mongodb database and provides a web interface to manage them"
  s.homepage    = "http://github.com/Consoci8/exception_engine"
  s.authors     = ["Muhammad Fadhli Rahim"]
  s.email       = "fadhlirahim@gmail.com"
   
  s.files = Dir["lib/**/*"] + ["Gemfile", "Gemfile.lock", "GPLv3.txt", "LICENSE.txt", "Rakefile", "README.rdoc"] + Dir["app/**/*"] + ["config/routes.rb"]
  s.test_files = Dir["test/**/*"]
  s.version = ExceptionEngine::VERSION.dup
  
  s.require_paths = ["lib"]
  s.add_dependency("mongoid", "2.0.0.rc.5")
  s.add_dependency("bson_ext", "1.2.4")
end

 