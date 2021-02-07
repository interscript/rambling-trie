# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'rambling/trie/version'

Gem::Specification.new do |gem|
  gem.authors = ['Ribose Open']

  gem.description = <<~DESCRIPTION.gsub(%r{\s+}, ' ')
    The Rambling Trie Opal is an opal compatible version of rambling-trie gem.
  DESCRIPTION

  gem.summary = 'A Ruby implementation (Opal Compatible) of the trie data structure.'
  gem.homepage = 'http://github.com/interscript/rambling-trie'
  gem.date = Time.now.strftime '%Y-%m-%d'

  executables = `git ls-files -- bin/*`.split "\n"
  files = `git ls-files -- {lib,*file,*.gemspec,LICENSE*,README*}`.split "\n"
  test_files = `git ls-files -- {test,spec,features}/*`.split "\n"

  gem.executables = executables.map { |f| File.basename f }
  gem.files = files
  gem.test_files = test_files
  gem.require_paths = %w(lib)

  gem.name = 'rambling-trie-opal'
  gem.license = 'MIT'
  gem.version = Rambling::Trie::VERSION
  gem.platform = Gem::Platform::RUBY
  gem.required_ruby_version = '>= 2.4'

  gem.add_development_dependency 'rake', '~> 13.0'
  gem.add_development_dependency 'rspec', '~> 3.9'
  gem.add_development_dependency 'yard', '~> 0.9.25'
end
