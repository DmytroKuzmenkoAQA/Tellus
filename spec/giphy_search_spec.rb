
# frozen_string_literal: true

require 'rspec'
require 'dotenv/load'
require 'json'
require_relative '../lib/giphy_client'


RSpec.describe GiphyClient do
  let(:api_key) { ENV.fetch('GIPHY_API_KEY') }
  let(:client) { GiphyClient.new(api_key) }
  let(:query) { 'Cats' }
  let(:limit) { 10 }
  let(:offset) { 10 }

  describe '#search' do
    context 'with valid parameters' do
      it 'returns a correct response with pagination' do
        response = client.search(query: query, limit: limit, offset: offset)
        # Uncomment for debugging:
        # puts JSON.pretty_generate(response.parsed_response)

        expect(response.code).to eq(200)
        expect(response.parsed_response).to be_a(Hash)

        meta = response.parsed_response['meta']
        expect(meta['status']).to eq(200)
        expect(meta['msg']).to eq('OK')

        data = response.parsed_response['data']
        expect(data).to be_an(Array)
        expect(data).not_to be_empty
        expect(data.size).to eq(limit)

        pagination = response.parsed_response['pagination']
        expect(pagination).to be_a(Hash)
        expect(pagination['count']).to eq(limit)
        expect(pagination['offset']).to eq(offset)

        expect(data.any? do |gif|
        title = gif['title'].to_s.downcase
        slug = gif['slug'].to_s.downcase
        title.include?(query.downcase) || slug.include?(query.downcase)
      end).to be true
      end
    end

    context 'with invalid API key' do
      let(:client) { GiphyClient.new('invalid_key') }
      it 'returns an error response' do
        response = client.search(query: query, limit: limit, offset: offset)
        expect(response.code).not_to eq(200)
        expect(response.parsed_response['meta']['status']).not_to eq(200)
      end
    end
  end
end
