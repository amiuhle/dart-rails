$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "dart/rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "dart-rails"
  s.version     = Dart::Rails::VERSION
  s.authors     = ["Timo Uhlmann"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of DartRails."
  s.description = "TODO: Description of DartRails."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile"] #, "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "ruby-dart" #, "~> 3.2.6"

  # s.add_development_dependency "sqlite3"
end
