class Search

  attr_reader :response

  def initialize(api_response)
    @response = api_response
  end

  def results
    @results ||= @response['hits'].map do |hit|
      Result.new(hit)
    end
  end

  def current_page
    @response['page']
  end

  def total_pages
    @response["nbPages"]
  end

  def has_more_pages?
    current_page < total_pages - 1
  end

  def total_results
    @response["nbHits"]
  end

  class Result

    attr_reader :response

    def initialize(response)
      @response = response
    end

    def image
      response['logo_url_60_60']
    end

    def name
      response['name']
    end

    def description
      response['description']
    end
  end

end