require "utilities_tbwa/version"
require "fileutils"
require 'thor'

module UtilitiesTbwa
	class Generator < Thor
		map ['-v', '--version'] => :version

		desc 'install', 'Install Utilities_tbwa into your project'
		method_options :path => :string, :force => :boolean
		def install
      if utilities_already_exist? && !options[:force]
        puts "Utilities already installed, doing nothing."
      else
        install_files
        puts "Utilities installed to #{install_path}/"
      end
    end
    
    desc 'update', 'Update Utilities_tbwa'
    method_options :path => :string
    def update
      if utilities_already_exist?
        remove_utilities_directory
        install_files
        puts "Utilities updated."
      else
        puts "No existing utilities installation. Doing nothing."
      end
    end

    desc 'version', 'Show Utilities version'
    def version
      say "Utilities_tbwa #{UtilitiesTbwa::VERSION}"
    end

    private

    def utilities_already_exist?
      install_path.exist?
    end

    def install_path
      @install_path ||= if options[:path]
          Pathname.new(File.join(options[:path], 'app/assets/stylesheets/utilities'))
        else
          Pathname.new('app/assets/stylesheets/utilities')
        end
    end

    def install_files
      make_install_directory
      copy_in_scss_files
    end

    def remove_utilities_directory
      FileUtils.rm_rf("app/assets/stylesheets/utilities")
    end

    def make_install_directory
      FileUtils.mkdir_p(install_path)
    end

    def copy_in_scss_files
      FileUtils.cp_r(all_stylesheets, install_path)
    end

    def all_stylesheets
      Dir["#{stylesheets_directory}/*"]
    end

    def stylesheets_directory
      File.join(top_level_directory, "app", "assets", "stylesheets")
    end

    def top_level_directory
      File.dirname(File.dirname(File.dirname(__FILE__)))
    end
	end
end
