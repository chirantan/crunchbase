class CrunchbaseApi
  IMAGE_BASE_PATH = "http://images.crunchbase.com/"
  WEB_BASE_PATH = "http://www.crunchbase.com/"
  include HTTParty
  base_uri 'http://api.crunchbase.com/v/2'
  default_params user_key: "27e1c00cb39307567e7cff0615330f89", order: "created_at DESC"
  format :json

  def self.product(identifier)
    response = get("/product/#{identifier}").parsed_response
    Product.new(response)
  end

end