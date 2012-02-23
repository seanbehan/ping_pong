$:.unshift File.expand_path(File.dirname(__FILE__))

require "yaml"
require "lib/initializers"

require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

environment = YAML.load_file("config/database.yml")["#{Sinatra.env}"]

set :database, environment["database"]

ActiveRecord::Base.logger = Logger.new File.open("log/#{Sinatra.env}.log", 'a')

require "models/player"
require "models/game"

also_reload 'models/player'
also_reload 'models/game'

require "web_app"
