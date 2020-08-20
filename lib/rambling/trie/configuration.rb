# frozen_string_literal: true

# %w(properties provider_collection).each do |file|
#   require File.join('rambling', 'trie', 'configuration', file)
# end

require 'rambling/trie/configuration/properties'
require 'rambling/trie/configuration/provider_collection'

module Rambling
  module Trie
    # Namespace for configuration classes.
    module Configuration
    end
  end
end
