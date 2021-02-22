# frozen_string_literal: true

source 'https://rubygems.org'

gemspec

gem 'rubyzip'

group :development do
  gem 'benchmark-ips'
  gem 'flamegraph'
  gem 'memory_profiler'
  gem 'pry'
  gem 'ruby-prof'
  gem 'stackprof' unless Gem.win_platform?
end

group :test do
  gem 'coveralls', '~>0.8.21', require: false
  gem 'simplecov', require: false
end

group :local do
  gem 'guard-rspec'
  gem 'rubocop', require: false
end
