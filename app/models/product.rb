class Product

  attr_reader :response

  def initialize(api_response)
    @response = api_response
  end

  def overview
    properties['description']
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

  def image
    image_path_prefix + relationships['primary_image']['items'].first['path']
  end

  private

  def image_path_prefix
    response['metadata']['image_path_prefix']
  end

  def www_path_prefix
    response['metadata']['www_path_prefix']
  end

  def properties
    response['data']['properties']
  end

  def relationships
    response['data']['relationships']
  end

end