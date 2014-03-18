$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "historiqueux/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "historiqueux"
  s.version     = Historiqueux::VERSION
  s.authors     = ["Groupe Fungo inc."]
  s.email       = ["ssavoie@fungo.ca"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Historiqueux."
  s.description = "TODO: Description of Historiqueux."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.3"

  s.add_development_dependency "rspec-rails"
  s.add_dependency "paper_trail"

end
