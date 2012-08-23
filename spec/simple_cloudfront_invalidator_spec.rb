require 'test_helper'

module SimpleCloudfrontInvalidator
  describe CloudfrontClient do
    it "calls the Cloudfront invalidation API" do
      VCR.use_cassette('cloudfront', :match_requests_on => [:host]) do
        @client = CloudfrontClient.new('some aws key', 'aws secret', 'cloudfrontdistid')
        report = @client.invalidate(['index.html', 'articles.html'])
        report.join('').should include("Invalidating Cloudfront items...")
        report.join('').should include("/index.html")
        report.join('').should include("/articles.html")
        report.join('').should include("succeeded")
      end
    end
  end
end
