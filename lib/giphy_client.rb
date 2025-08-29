# frozen_string_literal: true

require 'httparty'

class GiphyClient
  BASE_URL = 'https://api.giphy.com/v1/gifs/search'

  def initialize(api_key)
    @api_key = api_key
  end

  def search(query:, limit:, offset:)
    HTTParty.get(BASE_URL, query: {
      api_key: @api_key,
      q: query,
      limit: limit,
      offset: offset
    })
  end
end
