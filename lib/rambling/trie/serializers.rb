# frozen_string_literal: true

if RUBY_ENGINE == 'opal'
  require 'rambling/trie/serializers/file'
  require 'rambling/trie/serializers/marshal'
  require 'rambling/trie/serializers/yaml'
else    
  %w(file marshal yaml zip).each do |file|
    require File.join('rambling', 'trie', 'serializers', file)
  end
end

module Rambling
  module Trie
    # Namespace for all serializers.
    module Serializers
    end
  end
end
