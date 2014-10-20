# CodeKit needs relative paths
dir = File.dirname(__FILE__)
$LOAD_PATH.unshift dir unless $LOAD_PATH.include?(dir)

require "utilities_tbwa/generator"

unless defined?(Sass)
  require 'sass'
end

module UtilitiesTbwa
	if defined?(Rails) && defined?(Rails::Engine)
		class Engine < ::Rails::Engine
      require 'utilities_tbwa/engine'
    end

    module Rails
	  	class Railtie < ::Rails::Railtie
	  		rake_tasks do
          load "tasks/install.rake"
        end
	  	end
	  end
	else
		utillities_path = File.expand_path("../../app/assets/stylesheets", __FILE__)
    ENV["SASS_PATH"] = [ENV["SASS_PATH"], utillities_path].compact.join(File::PATH_SEPARATOR)
	end
end
