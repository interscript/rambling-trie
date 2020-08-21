# frozen_string_literal: true

if RUBY_ENGINE == 'opal'
  require 'rambling/trie/nodes/node'
  require 'rambling/trie/nodes/compressed'
  require 'rambling/trie/nodes/missing'
  require 'rambling/trie/nodes/raw'
else
  %w(node missing compressed raw).each do |file|
    require File.join('rambling', 'trie', 'nodes', file)
  end
end

module Rambling
  module Trie
    # Namespace for all nodes.
    module Nodes
    end
  end
end
