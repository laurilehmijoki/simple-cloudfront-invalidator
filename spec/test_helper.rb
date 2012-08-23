require 'vcr'
require 'require_relative'
require_relative '../lib/cloudfront-invalidator'

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/cassettes"
  config.hook_into :webmock
end
