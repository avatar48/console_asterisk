# This file is used by Rack-based servers to start the application.


require ::File.expand_path('../config/environment', __FILE__)
run Rails.application

# require 'resque/servers'
# run Rack::URLMap.new "/" => AppName::Application, "/resque" => Resque::Server.new

require 'resque/server' 
# require 'resque/tasks'
# require 'resque/scheduler/tasks' 
run Rack::URLMap.new "/" => Aster::Application,  "/resque" => Resque::Server.new