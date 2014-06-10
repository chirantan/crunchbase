class CrunchbaseApi
  IMAGE_BASE_PATH = "http://images.crunchbase.com/"
  WEB_BASE_PATH = "http://www.crunchbase.com/"
  ORDER = "created_at DESC"
  USER_KEY = "27e1c00cb39307567e7cff0615330f89"
  include HTTParty
  base_uri 'http://api.crunchbase.com/v/2'
  default_params user_key: USER_KEY, order: ORDER
  format :json

  def self.product(identifier)
    response = get("/product/#{identifier}").parsed_response
    Product.new(response)
  end

end