# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{jakewendt-simply_pages}
  s.version = "1.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["George 'Jake' Wendt"]
  s.date = %q{2010-10-26}
  s.description = %q{longer description of your gem}
  s.email = %q{github@jake.otherinbox.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    "app/controllers/locales_controller.rb",
     "app/controllers/pages_controller.rb",
     "app/models/page.rb",
     "app/models/page_sweeper.rb",
     "app/views/pages/_child.html.erb",
     "app/views/pages/_form.html.erb",
     "app/views/pages/_page.html.erb",
     "app/views/pages/edit.html.erb",
     "app/views/pages/index.html.erb",
     "app/views/pages/new.html.erb",
     "app/views/pages/show.html.erb",
     "app/views/pages/translate.js.erb",
     "config/routes.rb",
     "generators/simply_pages/USAGE",
     "generators/simply_pages/simply_pages_generator.rb",
     "generators/simply_pages/templates/functional/locales_controller_test.rb",
     "generators/simply_pages/templates/functional/pages_controller_test.rb",
     "generators/simply_pages/templates/images/drag.gif",
     "generators/simply_pages/templates/javascripts/pages.js",
     "generators/simply_pages/templates/migrations/create_pages.rb",
     "generators/simply_pages/templates/stylesheets/page.css",
     "generators/simply_pages/templates/stylesheets/pages.css",
     "generators/simply_pages/templates/unit/page_test.rb",
     "generators/simply_pages/templates/unit/redcloth_extension_test.rb",
     "lib/simply_pages.rb",
     "lib/simply_pages/factories.rb",
     "lib/simply_pages/pending.rb",
     "lib/simply_pages/redcloth/formatters/html.rb",
     "lib/simply_pages/tasks.rb"
  ]
  s.homepage = %q{http://github.com/jakewendt/simply_pages}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{one-line summary of your gem}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<i18n>, ["= 0.3.7"])
      s.add_runtime_dependency(%q<rails>, ["~> 2"])
      s.add_runtime_dependency(%q<jrails>, [">= 0"])
      s.add_runtime_dependency(%q<jakewendt-simply_helpful>, [">= 0"])
      s.add_runtime_dependency(%q<jakewendt-ruby_extension>, [">= 0"])
      s.add_runtime_dependency(%q<jakewendt-simply_authorized>, [">= 0"])
      s.add_runtime_dependency(%q<ssl_requirement>, [">= 0"])
      s.add_runtime_dependency(%q<ryanb-acts-as-list>, [">= 0"])
      s.add_runtime_dependency(%q<RedCloth>, [">= 0"])
      s.add_runtime_dependency(%q<thoughtbot-factory_girl>, [">= 0"])
      s.add_runtime_dependency(%q<jakewendt-assert_this_and_that>, [">= 0"])
      s.add_runtime_dependency(%q<jakewendt-calnet_authenticated>, [">= 0"])
    else
      s.add_dependency(%q<i18n>, ["= 0.3.7"])
      s.add_dependency(%q<rails>, ["~> 2"])
      s.add_dependency(%q<jrails>, [">= 0"])
      s.add_dependency(%q<jakewendt-simply_helpful>, [">= 0"])
      s.add_dependency(%q<jakewendt-ruby_extension>, [">= 0"])
      s.add_dependency(%q<jakewendt-simply_authorized>, [">= 0"])
      s.add_dependency(%q<ssl_requirement>, [">= 0"])
      s.add_dependency(%q<ryanb-acts-as-list>, [">= 0"])
      s.add_dependency(%q<RedCloth>, [">= 0"])
      s.add_dependency(%q<thoughtbot-factory_girl>, [">= 0"])
      s.add_dependency(%q<jakewendt-assert_this_and_that>, [">= 0"])
      s.add_dependency(%q<jakewendt-calnet_authenticated>, [">= 0"])
    end
  else
    s.add_dependency(%q<i18n>, ["= 0.3.7"])
    s.add_dependency(%q<rails>, ["~> 2"])
    s.add_dependency(%q<jrails>, [">= 0"])
    s.add_dependency(%q<jakewendt-simply_helpful>, [">= 0"])
    s.add_dependency(%q<jakewendt-ruby_extension>, [">= 0"])
    s.add_dependency(%q<jakewendt-simply_authorized>, [">= 0"])
    s.add_dependency(%q<ssl_requirement>, [">= 0"])
    s.add_dependency(%q<ryanb-acts-as-list>, [">= 0"])
    s.add_dependency(%q<RedCloth>, [">= 0"])
    s.add_dependency(%q<thoughtbot-factory_girl>, [">= 0"])
    s.add_dependency(%q<jakewendt-assert_this_and_that>, [">= 0"])
    s.add_dependency(%q<jakewendt-calnet_authenticated>, [">= 0"])
  end
end

