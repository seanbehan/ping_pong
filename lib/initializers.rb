module Sinatra
  ENV["RACK_ENV"] = ENV["RACK_ENV"] || "development"

  def self.env
    Environment
  end
  
  class Environment
    class << self
      def to_s
        ENV["RACK_ENV"]
      end

      %W(production development test).each do |env|
        define_method "#{env}?" do
          ENV["RACK_ENV"] == env
        end
      end
    end
  end
end