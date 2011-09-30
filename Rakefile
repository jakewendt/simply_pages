require(File.join(File.dirname(__FILE__), 'config', 'boot'))

# Use the updated rdoc gem rather than version
# included with ruby.
#require 'rdoc'

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Generate documentation for the app.'
Rake::RDocTask.new(:rdoc) do |rdoc|
	rdoc.rdoc_dir = 'rdoc'
	rdoc.title		= 'Simply Pages'
	rdoc.options << '--line-numbers' << '--inline-source'
	rdoc.rdoc_files.include('README')
	rdoc.rdoc_files.include('lib/**/*.rb')
end

require 'tasks/rails'


begin
	require 'jeweler'
	Jeweler::Tasks.new do |gem|
		gem.name = "jakewendt-simply_pages"
		gem.summary = %Q{A simple CMS}
		gem.description = %Q{A really simple CMS}
		gem.email = "github@jakewendt.com"
		gem.homepage = "http://github.com/jakewendt/simply_pages"
		gem.authors = ["George 'Jake' Wendt"]
		# gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings

		gem.files  = FileList['generators/**/*']
		gem.files -= FileList['**/versions/*']
	end
	Jeweler::GemcutterTasks.new
rescue LoadError
	puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end
