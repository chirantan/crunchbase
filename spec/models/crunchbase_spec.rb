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
      expect(@product.crunchbase_url).to eq("http://www.crunchbase.com/product/#{product_name}")
    end

    it "should have the right press_news" do
      expect(@product.press_news).to eq([
         {
            "url"        => "http://www.twitter.com/Librato",
            "type"       => "WebPresence",
            "title"      => "twitter",
            "created_at" => 1397877760,
            "updated_at" => 2014
         },
         {
            "url"        => "http://www.linkedin.com/company/373662",
            "type"       => "WebPresence",
            "title"      => "linkedin",
            "created_at" => 1397877760,
            "updated_at" => 2014
         },
         {
            "url"        => "http://www.plus.google.com/100276766126896543090",
            "type"       => "WebPresence",
            "title"      => "google+",
            "created_at" => 1397877760,
            "updated_at" => 2014
         },
         {
            "url"        => "http://www.facebook.com/libratoinc",
            "type"       => "WebPresence",
            "title"      => "facebook",
            "created_at" => 1397877760,
            "updated_at" => 2014
         },
         {
            "url"        => "http://www.twitter.com/librato",
            "type"       => "WebPresence",
            "title"      => "twitter",
            "created_at" => 1319736667,
            "updated_at" => 1397996008
         },
         {
            "url"        => "http://blog.librato.com",
            "type"       => "WebPresence",
            "title"      => "blog",
            "created_at" => 1319736667,
            "updated_at" => 1397996008
         },
         {
            "url"        => "http://www.librato.com",
            "type"       => "WebPresence",
            "title"      => "homepage",
            "created_at" => 1319736667,
            "updated_at" => 1402162474
         }
      ])
    end

    it "should have the right image" do
      expect(@product.image).to eq("http://images.crunchbase.com/image/upload/v1402162492/xvku6ryszu6i2ltf5a22.png")
    end
  end

  describe ".organization" do
    let(:organization_name) { "tradeshift" }

    before do
      stub_request(
        :get,
        "http://api.crunchbase.com/v/2/organization/#{organization_name}?order=#{CrunchbaseApi::ORDER}&user_key=#{CrunchbaseApi::USER_KEY}"
      ).to_return(
        :body => File.read("spec/fixtures/files/organization.json")
      )
      @organization = CrunchbaseApi.organization(organization_name)
    end

    it "should have the right overview" do
      expect(@organization.overview).to eq("As a platform for all your business interactions, Tradeshift helps companies run more efficiently, harnessing the power of their network to create new value from old processes like invoicing, payments and workflow.\r\n\r\nFor smaller companies, a free account with apps like e-invoicing can become a route to getting paid faster or even open doors like dynamic discounting. Meanwhile, Tradeshift Apps allow them to securely link in other key processes like online accounting in seconds.\r\n\r\nFor enterprises that work with tens of thousands of companies like this, they find themselves already connected to partners of all sizes on a single, global, 100% electronic platform.\r\n\r\nTradeshift is the first step toward a smarter, better, network-powered business.\r\n\r\nTradeshift was founded in 2009 and launched in 2010, with the goal to change how business is done. Headquartered in San Francisco, Tradeshift has offices in Copenhagen, London, and Amsterdam. Tradeshift employs 70 staff across 18 different nationalities")
    end

    it "should have the right crunchbase_url" do
      expect(@organization.crunchbase_url).to eq("http://www.crunchbase.com/organization/#{organization_name}")
    end

    it "should have the right company_people" do
      expect(@organization.company_people).to eq([
     {
      "first_name" => "Christian",
      "last_name"  => "Lanng",
      "title"      => "CEO & Co-founder",
      "started_on" => "2009-07-01",
      "path"       => "person/christian-lanng",
      "created_at" => 1267106765,
      "updated_at" => 1397989125
     },
     {
      "first_name" => "Mikkel",
      "last_name"  => "Hippe Brun",
      "title"      => "CSO & Co-founder",
      "started_on" => "2009-07-01",
      "path"       => "person/mikkel-hippe-brun",
      "created_at" => 1267106804,
      "updated_at" => 1397989125
     },
     {
      "first_name" => "Gert",
      "last_name"  => "Sylvest",
      "title"      => "CTO & Co-founder",
      "started_on" => "2009-07-01",
      "path"       => "person/gert-sylvest",
      "created_at" => 1398793484,
      "updated_at" => 1398793484
     },
     {
      "first_name" => "Christian",
      "last_name"  => "Hjorth",
      "title"      => "CCO",
      "started_on" => "2010-07-01",
      "path"       => "person/christian-hjorth",
      "created_at" => 1298160373,
      "updated_at" => 1397989180
     },
     {
      "first_name" => "Patrick",
      "last_name"  => "Svenburg",
      "title"      => "VP, Strategic Business Development",
      "started_on" => "2013-02-01",
      "path"       => "person/patrick-svenburg",
      "created_at" => 1265064771,
      "updated_at" => 1397988988
     },
     {
      "first_name" => "Mihir",
      "last_name"  => "Nanavati",
      "title"      => "VP of product management",
      "started_on" => nil,
      "path"       => "person/mihir-nanavati",
      "created_at" => 1398793638,
      "updated_at" => 1398793638
     },
     {
      "first_name" => "Andy",
      "last_name"  => "Huang",
      "title"      => "VP of Global Strategy",
      "started_on" => nil,
      "path"       => "person/andy-huang-2",
      "created_at" => 1350684931,
      "updated_at" => 1397989491
     },
     {
      "first_name" => "Peter",
      "last_name"  => "Van Pruissen",
      "title"      => "CFO",
      "started_on" => "2013-01-01",
      "path"       => "person/peter-van-pruissen",
      "created_at" => 1184921035,
      "updated_at" => 1397988937
     }
    ])
    end

    it "should have the right image" do
      expect(@organization.image).to eq("http://images.crunchbase.com/image/upload/v1397203778/ac022ae64c92ea91796b49bcae2b0102.jpg")
    end
  end

  describe ".search" do
  end

end