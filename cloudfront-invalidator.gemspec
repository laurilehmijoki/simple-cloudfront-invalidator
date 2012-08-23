Gem::Specification.new do |s|
  s.name          = 'cloudfront-invalidator'
  s.version       = '0.0.1'
  s.license       = 'MIT'
  s.summary       = 'A library for invalidating Cloudfront distributions'
  s.authors       = ['Lauri Lehmijoki']
  s.email         = 'lauri.lehmijoki@iki.fi'
  s.files         = `git ls-files`.split("\n")
  s.require_paths = ['lib']
  s.homepage      = 'https://github.com/laurilehmijoki/cloudfront-invalidator'

  s.add_dependency 'colored', '= 1.2'

  s.add_development_dependency 'cucumber'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'aruba', '>= 0.4.7'
end
