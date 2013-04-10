Gem::Specification.new do |spec|
  spec.name          = "crew-corner"
  spec.version       = "0.1.0"
  spec.authors       = [ "Stefan Lindbohm" ]
  spec.email         = [ "stefan@kolizz.com" ]
  spec.summary       = "Crew Corner API client"
  spec.description   = ""
  spec.homepage      = "http://api.crew.dreamhack.se"
  spec.files         = ::Dir.glob("lib/**/*.rb")

  spec.add_development_dependency('rake')
end
