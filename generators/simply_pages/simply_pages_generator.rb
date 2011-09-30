class SimplyPagesGenerator < Rails::Generator::Base

	def manifest
		#	See Rails::Generator::Commands::Create
		#	rails-2.3.10/lib/rails_generator/commands.rb
		#	for code methods for record (Manifest)
		record do |m|

			#	Will add this multiple times with multiple calls.
			#	TODO Would like to only do it conditionally.
			#	TODO Also, would prefer a bit more as have other routes.
			m.route_resources :pages

#			m.directory('config/autotest')
#			m.file('autotest_simply_pages.rb', 'config/autotest/simply_pages.rb')
#			m.directory('lib/tasks')
#			m.file('simply_pages.rake', 'lib/tasks/simply_pages.rake')

#			File.open('Rakefile','a'){|f| 
#				f.puts <<-EOF
##	From `script/generate simply_pages` ...
#require 'simply_pages/test_tasks'
#				EOF
#			}
#
#			File.open('.autotest','a'){|f| 
#				f.puts <<-EOF
##	From `script/generate simply_pages` ...
#require 'simply_pages/autotest'
#				EOF
#			}

			%w( create_pages ).each do |migration|
				m.migration_template "migrations/#{migration}.rb",
					'db/migrate', :migration_file_name => migration
			end

			m.directory('public/javascripts')
			Dir["#{File.dirname(__FILE__)}/templates/javascripts/*js"].each{|file| 
				f = file.split('/').slice(-2,2).join('/')
				m.file(f, "public/javascripts/#{File.basename(file)}")
			}
			m.directory('public/stylesheets')
			Dir["#{File.dirname(__FILE__)}/templates/stylesheets/*css"].each{|file| 
				f = file.split('/').slice(-2,2).join('/')
				m.file(f, "public/stylesheets/#{File.basename(file)}")
			}

			m.directory('app/models')
			Dir["#{dot}/templates/models/*rb"].each{|file| 
				f = file.split('/').slice(-2,2).join('/')
				m.file(f, "app/models/#{File.basename(file)}")
			}

			m.directory('app/controllers ')
			Dir["#{dot}/templates/controllers/*rb"].each{|file| 
				f = file.split('/').slice(-2,2).join('/')
				m.file(f, "app/controllers/#{File.basename(file)}")
			}

			m.directory('app/views/pages')
			Dir["#{dot}/templates/views/pages/*rb"].each{|file| 
				f = file.split('/').slice(-3,3).join('/')			has an extra directory in path
				m.file(f, "app/views/pages/#{File.basename(file)}")
			}

			m.directory('test/functional')
			Dir["#{dot}/templates/functional/*rb"].each{|file| 
				f = file.split('/').slice(-2,2).join('/')
				m.file(f, "test/functional/#{File.basename(file)}")
			}

			m.directory('test/unit')
			Dir["#{dot}/templates/unit/*rb"].each{|file| 
				f = file.split('/').slice(-2,2).join('/')
				m.file(f, "test/unit/#{File.basename(file)}")
			}

		end
	end

end
module Rails::Generator::Commands
	class Create
		def migration_template(relative_source, 
				relative_destination, template_options = {})
			migration_directory relative_destination
			migration_file_name = template_options[
				:migration_file_name] || file_name
			if migration_exists?(migration_file_name)
				puts "Another migration is already named #{migration_file_name}: #{existing_migrations(migration_file_name).first}: Skipping" 
			else
				template(relative_source, "#{relative_destination}/#{next_migration_string}_#{migration_file_name}.rb", template_options)
			end
		end
	end #	Create
	class Base
	protected
		#	the loop through migrations happens so fast
		#	that they all have the same timestamp which
		#	won't work when you actually try to migrate.
		#	All the timestamps MUST be unique.
		def next_migration_string(padding = 3)
			@s = (!@s.nil?)? @s.to_i + 1 : if ActiveRecord::Base.timestamped_migrations
				Time.now.utc.strftime("%Y%m%d%H%M%S")
			else
				"%.#{padding}d" % next_migration_number
			end
		end
	end	#	Base
end
