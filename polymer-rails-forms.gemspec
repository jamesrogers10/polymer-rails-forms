Gem::Specification.new do |s|
  s.name        = 'polymer-rails-forms'
  s.version     = '0.2.01'
  s.date        = Date.today.strftime("%Y-%m-%d")
  s.summary     = "For creating rails compatable forms using the power of Polymer"
  s.description = "Not ready yet"
  s.authors     = ["Joel Weber", "James Rogers"]
  s.email       = 'joel@gearcommons.com'
  s.files       = Dir.glob("{assets,lib}/**/*") + %w(LICENSE README.md)
  s.homepage    = 'https://gihub.com/gearcommons/polymer-rails-forms'
  s.license     = 'MIT'
  s.add_runtime_dependency 'emcee', 
    [">= 1.0.9"]
end