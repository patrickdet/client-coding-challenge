require 'test_helper'
require 'storage/local_disk_strategy'

describe Storage::LocalDiskStrategy do
  subject { Storage::LocalDiskStrategy }

  describe '#initialize' do
    it 'creates the target directory' do
      subject.new(target_directory: '/tmp/foobar', image_url: 'http://example.com/somepath/my_picture.jpg', content: nil)

      expect(File.directory?('/tmp/foobar')).must_equal true
    end
  end

  describe '#store' do
    it 'writes the contents to disk' do
      content = '123foobar'
      instance = subject.new(target_directory: '/tmp/foobar', image_url: 'http://example.com/somepath/my_picture.jpg', content: content)
      instance.store

      expect(File.read('/tmp/foobar/my_picture.jpg')).must_equal(content)
    end
  end
end
