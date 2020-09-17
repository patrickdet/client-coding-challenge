require 'test_helper'
require 'cli/behaviour'

describe Cli::Behaviour do
  subject { Cli::Behaviour }

  describe '#initialize' do
    it 'can be instantiated' do
      subject.new(source_file_path: '/tmp/input')
    end
  end

  describe '#fetch_and_store' do
    it 'can be instantiated' do
      target_directory = '/tmp/output'
      instance = subject.new(source_file_path: 'test/fixtures/good_urls', target_directory: target_directory)
      urls = [
        'http://example.com/somepath/my_picture.jpg',
        'http://example.com/somepath/another_picture.jpg'
      ]

      FetchAndStorePipe.expects(:new).with(
        has_entries(
          input: urls,
          fetcher: ::Fetcher::HttpStrategy,
          storage: [::Storage::LocalDiskStrategy, target_directory: target_directory],
          error_handler: ::ErrorHandler::AccumulateAndLogStrategy
        )
      ).returns(mock(perform: nil))

      instance.fetch_and_store
    end
  end
end
