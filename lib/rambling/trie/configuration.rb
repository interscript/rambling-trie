# frozen_string_literal: true

if RUBY_ENGINE == 'opal'
  require 'rambling/trie/configuration/properties'
  require 'rambling/trie/configuration/provider_collection'  
else
  %w(properties provider_collection).each do |file|
    require File.join('rambling', 'trie', 'configuration', file)
  end
end

module Rambling
  module Trie
    # Namespace for configuration classes.
    module Configuration
    end
  end
end
