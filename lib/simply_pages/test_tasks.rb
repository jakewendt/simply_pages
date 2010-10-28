module SimplyPages;end
namespace :test do
	namespace :units do
		Rake::TestTask.new(:simply_pages => "db:test:prepare") do |t|
			t.pattern = File.expand_path(File.join(
				File.dirname(__FILE__),'/../../test/unit/pages/*_test.rb'))
#				File.dirname(__FILE__),'/../../test/unit/**/*_test.rb'))
			t.libs << "test"
			t.verbose = true
		end
	end
	namespace :functionals do
		Rake::TestTask.new(:simply_pages => "db:test:prepare") do |t|
			t.pattern = File.expand_path(File.join(
				File.dirname(__FILE__),'/../../test/functional/pages/*_test.rb'))
#				File.dirname(__FILE__),'/../../test/functional/**/*_test.rb'))
			t.libs << "test"
			t.verbose = true
		end
	end
end
Rake::Task['test:functionals'].prerequisites.unshift(
	"test:functionals:simply_pages" )
Rake::Task['test:units'].prerequisites.unshift(
	"test:units:simply_pages" )
