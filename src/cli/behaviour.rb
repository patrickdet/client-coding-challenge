require 'error_handler/accumulate_and_log_strategy'
require 'fetch_and_store_pipe'
require 'fetcher/http_strategy'
require 'securerandom'
require 'storage/local_disk_strategy'

module Cli
  class Behaviour
    def initialize(source_file_path:, target_directory: nil)
      @source_file_path = source_file_path
      @target_directory = target_directory || "/tmp/#{SecureRandom.uuid}"
    end

    def fetch_and_store
      ::FetchAndStorePipe.new(
        input: input_file_urls,
        fetcher: ::Fetcher::HttpStrategy,
        storage: [::Storage::LocalDiskStrategy, target_directory: @target_directory],
        error_handler: ::ErrorHandler::AccumulateAndLogStrategy
      ).perform
    end

    private

    def input_file_urls
      File.read(@source_file_path).split("\n").map(&:strip)
    end
  end
end
