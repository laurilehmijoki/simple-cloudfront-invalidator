Gem::Specification.new do |s|
  s.name          = 'simple-cloudfront-invalidator'
  s.version       = '1.1.0'
  s.license       = 'MIT'
  s.summary       = 'A library for invalidating Cloudfront distributions'
  s.authors       = ['Lauri Lehmijoki']
  s.email         = 'lauri.lehmijoki@iki.fi'
  s.files         = `git ls-files`.split("\n")
  s.require_paths = ['lib']
  s.homepage      = 'https://github.com/laurilehmijoki/simple-cloudfront-invalidator'

  s.add_dependency 'colored', '= 1.2'

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'require_relative'
end
