$:.unshift File.expand_path('src')
require 'cli/behaviour'

Cli::Behaviour.new(source_file_path: ARGV[0], target_directory: ARGV[1]).fetch_and_store
