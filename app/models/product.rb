class Product < ResponseBase

  attr_reader :response

  def initialize(api_response)
    @response = api_response
  end

  def crunchbase_url
    [
      www_path_prefix,
      "product/",
      properties['permalink']
    ].join
  end

  def press_news
    relationships['websites']['items']
  end

end