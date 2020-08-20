# frozen_string_literal: true

# %w(node missing compressed raw).each do |file|
#   require File.join('rambling', 'trie', 'nodes', file)
# end

require 'rambling/trie/nodes/node'
require 'rambling/trie/nodes/compressed'
require 'rambling/trie/nodes/missing'
require 'rambling/trie/nodes/raw'

module Rambling
  module Trie
    # Namespace for all nodes.
    module Nodes
    end
  end
end
