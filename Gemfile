# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'faraday', '~> 1.0'
gem 'faraday_middleware', '~> 1.0'

group :development, :test do
  gem 'pry'
  gem 'pry-byebug'
  gem 'dotenv'
  gem 'rake'
  gem 'awesome_print'
  gem 'rubocop', require: false
end

group :test do
  gem 'minitest'
  gem 'minitest-hooks'
  gem 'minitest-stub_any_instance'
  gem 'mocha', require: false
end
