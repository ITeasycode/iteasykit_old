$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "iteasykit/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name = "iteasykit"
  s.version = Iteasykit::VERSION
  s.authors = ["Eugene Peluhnya"]
  s.email = ["peluhnya@outlook.com"]
  s.homepage = "https://iteasycode.com"
  s.summary = "Summary of Iteasykit."
  s.description = "Description of Iteasykit."
  s.license = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.1"

  s.add_development_dependency "meta_request"
  s.add_dependency "pg"
  s.add_dependency "devise", '>= 3.4.3'
  s.add_dependency "friendly_id", "~> 5.2.4"
  #s.add_dependency "globalize", "~> 5.1.0"
  s.add_dependency "friendly_id-globalize"
  s.add_dependency "cancancan", "~> 2.1.3"
  s.add_dependency "acts_as_list"
  s.add_dependency "ancestry"
  s.add_dependency "ransack"
  s.add_dependency "mini_magick"
  s.add_dependency "kaminari"
  s.add_dependency "jquery-rails"
  s.add_dependency "jquery-ui-rails"
  s.add_dependency "sortable_tree_rails"
  s.add_dependency "rails_sortable"
  s.add_dependency "paper_trail"
  s.add_dependency "ckeditor"
  s.add_dependency "routing-filter"
  s.add_dependency "meta-tags"
  s.add_dependency 'carrierwave'
  s.add_dependency 'best_in_place', '~> 3.0.1'


end
