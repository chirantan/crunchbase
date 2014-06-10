class Organization < ResponseBase

  attr_reader :response

  def initialize(api_response)
    @response = api_response
  end

  def crunchbase_url
    [
      www_path_prefix,
      "organization/",
      properties['permalink']
    ].join
  end

  def company_people
    relationships['current_team']['items']
  end

end