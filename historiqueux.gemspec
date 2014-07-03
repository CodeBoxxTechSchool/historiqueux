$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "historiqueux/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "historiqueux"
  s.version     = Historiqueux::VERSION
  s.authors     = ["Groupe Fungo inc."]
  s.email       = ["ssavoie@fungo.ca"]
  s.homepage    = "https://github.com/groupefungo/historiqueux"
  s.summary     = "Add a bootstrap presentation layer to paper_trail"
  s.description = "Inject some routes in your app that provides screens that help visualize any ressource versions, values and differences. Provide the ability no navigate related entities versions details."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", ">= 4.0.3", '< 5'

  s.add_development_dependency "rspec-rails"
  s.add_dependency "paper_trail"

end
