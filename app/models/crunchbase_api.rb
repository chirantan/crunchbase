class CrunchbaseApi
  IMAGE_BASE_PATH = "http://images.crunchbase.com/"
  WEB_BASE_PATH = "http://www.crunchbase.com/"
  ORDER = "created_at DESC"
  USER_KEY = "27e1c00cb39307567e7cff0615330f89"
  SEARCH_API_KEY = "4de80b596b657e1250ae068635686c3b"
  SEARCH_APP_ID = "A0EF2HAQR0"
  include HTTParty
  base_uri 'http://api.crunchbase.com/v/2'
  default_params user_key: USER_KEY, order: ORDER
  format :json

  def self.product(identifier)
    response = get("/product/#{identifier}").parsed_response
    Product.new(response)
  end

  def self.organization(identifier)
    response = get("/organization/#{identifier}").parsed_response
    Organization.new(response)
  end

  def self.search(query, page = 0)
    old_base_uri = self.base_uri
    self.base_uri "http://search-3.crunchbase.com"
    organization_search_response = get("/1/indexes/main_production/query", :data => organization_data(query, page)).parsed_response
    product_search_response      = get("/1/indexes/main_production/query", :data => product_data(query, page)).parsed_response
    self.base_uri old_base_uri
    return :organization => Search.new(organization_search_response), :product => Search.new(product_search_response)
  end

  private

  def self.organization_data(query, page)
    {"params" => "query=#{query}&facets=*&distinct=true&page=#{page}&hitsPerPage=20&facetFilters=type%3AOrganization", "apiKey" => SEARCH_API_KEY, "appID" => SEARCH_APP_ID}
  end

  def self.product_data(query, page)
    {"params" => "query=#{query}&facets=*&distinct=true&page=#{page}&hitsPerPage=20&facetFilters=type%3AProduct", "apiKey" => SEARCH_API_KEY, "appID" => SEARCH_APP_ID}
  end

end