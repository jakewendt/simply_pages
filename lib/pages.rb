require 'ruby_extension'
require 'rails_helpers'
require 'authorized'
require 'gravatar'
require 'calnet_authenticated'
require 'acts_as_list'
module Pages
#	predefine namespace
end

#	This doesn't seem necessary
%w{models controllers}.each do |dir|
	path = File.expand_path(File.join(File.dirname(__FILE__), '../app', dir))
	ActiveSupport::Dependencies.autoload_paths << path
	ActiveSupport::Dependencies.autoload_once_paths << path
end

HTML::WhiteListSanitizer.allowed_attributes.merge(%w(
	id class style
))

require 'pages/redcloth/formatters/html'

if !defined?(RAILS_ENV) || RAILS_ENV == 'test'
	require 'active_support'
	require 'active_support/test_case'
	require 'factory_girl'
	require 'assert_this_and_that'
	require 'pages/factories'
	require 'pages/pending'
end

ActionController::Routing::Routes.add_configuration_file(
	File.expand_path(
		File.join(
			File.dirname(__FILE__), '../config/routes.rb')))

ActionController::Base.view_paths <<
	File.expand_path(
		File.join(
			File.dirname(__FILE__), '../app/views'))
