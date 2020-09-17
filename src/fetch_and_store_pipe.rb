class FetchAndStorePipe
  def initialize(input:, fetcher:, storage:, error_handler:)
    @input = input
    @fetcher = fetcher
    @storage = storage
    @error_handler = error_handler.new
  end

  def perform
    @input.each do |image_url|
      content = @fetcher.new(image_url: image_url).fetch
      initialize_storage_handler(image_url: image_url, content: content).store
    rescue StandardError => e
      @error_handler.handle(e)
    end

    @error_handler.flush
  end

  def initialize_storage_handler(image_url:, content:)
    if @storage.is_a?(Array)
      klass, args = @storage
      klass.new(**args, image_url: image_url, content: content)
    else
      @storage.new(image_url: image_url, content: content)
    end
  end
end
