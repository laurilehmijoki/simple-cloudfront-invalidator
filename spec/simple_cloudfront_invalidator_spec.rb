require 'test_helper'

module SimpleCloudfrontInvalidator
  describe CloudfrontClient do
    before(:each) do
      VCR.use_cassette('cloudfront', :match_requests_on => [:host]) do
        @client = CloudfrontClient.new('some aws key', 'aws secret', 'cloudfrontdistid')
        @report = @client.invalidate(['index.html', 'articles.html'])
      end
    end

    it "calls the Cloudfront invalidation API" do
      expect(@report).to_not be nil
    end

    it 'returns a textual report on the invalidation' do
      textual_report = @report[:text_report]
      textual_report.join('').should include("Invalidating Cloudfront items...")
      textual_report.join('').should include("/index.html")
      textual_report.join('').should include("/articles.html")
      textual_report.join('').should include("succeeded")
    end

    it 'returns the count of successfully invalidated items' do
      count = @report[:invalidated_items_count]
      expect(count).to be 2
    end
  end
end
