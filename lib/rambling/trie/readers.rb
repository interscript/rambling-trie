# frozen_string_literal: true

if RUBY_ENGINE == 'opal'
  require 'rambling/trie/readers/plain_text'
else
  %w(plain_text).each do |file|
    require File.join('rambling', 'trie', 'readers', file)
  end
end

module Rambling
  module Trie
    # Namespace for all readers.
    module Readers
    end
  end
end
