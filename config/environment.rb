# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.14' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

	config.gem 'jakewendt-simply_sessions'
	config.gem 'jakewendt-simply_authorized'
	config.gem 'jakewendt-simply_helpful'
	config.gem 'jakewendt-html_test'
	config.gem 'jakewendt-rails_extension'
	config.gem 'RedCloth', :version => '> 4.2.6'
	config.gem 'thoughtbot-factory_girl',
		:lib => 'factory_girl'

	config.frameworks -= [:active_resource]

	config.routes_configuration_file = File.expand_path(
		File.join(File.dirname(__FILE__),'..','test/config/routes.rb'))

	if RUBY_PLATFORM =~ /java/
		#	I'm surprised that I don't need this in my apps.
		config.gem 'activerecord-jdbcsqlite3-adapter',
			:lib => 'active_record/connection_adapters/jdbcsqlite3_adapter',
			:version => '~>0.9'
		#	1.0.1 is for rails 3 I think
		config.gem 'jdbc-sqlite3', :lib => 'jdbc/sqlite3'
		config.gem 'jruby-openssl', :lib => 'openssl'
	else
		config.gem "sqlite3"
	end
	
	config.after_initialize do
		load File.expand_path(File.join(File.dirname(__FILE__),'../lib/simply_pages.rb'))
	end

end
