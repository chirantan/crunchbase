require 'spec_helper'

describe CrunchbaseApi do

  describe ".product" do

    let(:product_name) { "metrics" }

    before do
      stub_request(
        :get,
        "http://api.crunchbase.com/v/2/product/#{product_name}?order=#{CrunchbaseApi::ORDER}&user_key=#{CrunchbaseApi::USER_KEY}"
      ).to_return(
        :body => File.read("spec/fixtures/files/product.json")
      )
      @product = CrunchbaseApi.product(product_name)
    end

    it "should have the right overview" do
      expect(@product.overview).to eq("Librato is a SaaS platform for Real-time Operations Analytics that accepts metrics from any source for real-time aggregation and transformation, anomaly detection, alerting, visual analysis and storage.\r\n\r\nThe service is designed so that users can leverage it for any and all type of metrics, making it possible to see website sign-ups alongside infrastructure and business metrics. Users can aggregate, transform and correlate the data that is important to their business regardless of its origin.\r\n\r\nData sources can be custom, commercial or open source Data Collectors or applications instrumented using one of the language bindings available for our API. There is an active user community building connectors for existing open source data collectors such as statsd, collectd or nagios, as well as other integrations and applications.\r\n\r\nSee More\r\n- See more at: http://www.crunchbase.com/organization/librato#sthash.YjHXTowd.dpuf")
    end

    it "should have the right crunchbase_url" do
      expect(@product.crunchbase_url).to eq("http://www.crunchbase.com/product/metrics")
    end

    it "should have the right press_news" do
      expect(@product.press_news).to eq([
         {
            "url" => "http://www.twitter.com/Librato",
            "type" => "WebPresence",
            "title" => "twitter",
            "created_at" => 1397877760,
            "updated_at" => 2014
         },
         {
            "url" => "http://www.linkedin.com/company/373662",
            "type" => "WebPresence",
            "title" => "linkedin",
            "created_at" => 1397877760,
            "updated_at" => 2014
         },
         {
            "url" => "http://www.plus.google.com/100276766126896543090",
            "type" => "WebPresence",
            "title" => "google+",
            "created_at" => 1397877760,
            "updated_at" => 2014
         },
         {
            "url" => "http://www.facebook.com/libratoinc",
            "type" => "WebPresence",
            "title" => "facebook",
            "created_at" => 1397877760,
            "updated_at" => 2014
         },
         {
            "url" => "http://www.twitter.com/librato",
            "type" => "WebPresence",
            "title" => "twitter",
            "created_at" => 1319736667,
            "updated_at" => 1397996008
         },
         {
            "url" => "http://blog.librato.com",
            "type" => "WebPresence",
            "title" => "blog",
            "created_at" => 1319736667,
            "updated_at" => 1397996008
         },
         {
            "url" => "http://www.librato.com",
            "type" => "WebPresence",
            "title" => "homepage",
            "created_at" => 1319736667,
            "updated_at" => 1402162474
         }
      ])
    end

    it "should have the right overview" do
      expect(@product.image).to eq("http://images.crunchbase.com/image/upload/v1402162492/xvku6ryszu6i2ltf5a22.png")
    end
  end

  describe ".organization" do
  end

  describe ".search" do
  end

end