module Fetcher
  class DemoStrategy
    def initialize(image_url:); end

    def fetch
      File.read('static/images/demo.png')
    end
  end
end
