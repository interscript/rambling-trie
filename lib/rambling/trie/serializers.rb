# frozen_string_literal: true

# %w(file marshal yaml zip).each do |file|
#   require File.join('rambling', 'trie', 'serializers', file)
# end

require 'rambling/trie/serializers/file'
require 'rambling/trie/serializers/marshal'
require 'rambling/trie/serializers/yaml'
# require 'rambling/trie/serializers/zip'

module Rambling
  module Trie
    # Namespace for all serializers.
    module Serializers
    end
  end
end
