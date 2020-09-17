require 'faraday'
require 'faraday_middleware'

module Fetcher
  class HttpStrategy
    IMAGE_MIME_TYPE = 'image'.freeze
    HTTP_OK = 200

    class UnableToFetch < StandardError; end

    def initialize(image_url:)
      @image_url = image_url
      @conn = Faraday.new do |conn|
        conn.adapter Faraday.default_adapter
      end
    end

    def fetch
      @response ||= @conn.get(@image_url)
      raise UnableToFetch, @image_url unless valid?

      @response.body
    end

    private

    def valid?
      status_ok? && image?
    end

    def image?
      !@response.nil? && @response.headers['content-type'].split('/').first == IMAGE_MIME_TYPE
    end

    def status_ok?
      !@response.nil? && @response.status == HTTP_OK
    end
  end
end
