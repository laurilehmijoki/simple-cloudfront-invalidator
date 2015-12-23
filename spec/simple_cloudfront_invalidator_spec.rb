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
      textual_report = @report[:text_report].join('')
      expect(textual_report).to include "Invalidating Cloudfront items..."
      expect(textual_report).to include "/index.html"
      expect(textual_report).to include "/articles.html"
      expect(textual_report).to include "succeeded"
    end

    it 'returns the count of successfully invalidated items' do
      count = @report[:invalidated_items_count]
      expect(count).to be 2
    end
  end
end
