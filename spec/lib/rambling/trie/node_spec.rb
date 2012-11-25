require 'spec_helper'

module Rambling
  module Trie
    describe Node do
      describe '.new' do
        context 'with no letters' do
          let(:node) { Node.new '' }

          it 'does not have any letter' do
            expect(node.letter).to be_nil
          end

          it 'includes no children' do
            expect(node).to have(0).children
          end

          it 'is not a terminal node' do
            expect(node).to_not be_terminal
          end

          it 'returns empty string as its word' do
            expect(node.as_word).to be_empty
          end

          it 'is not compressed' do
            expect(node).to_not be_compressed
          end
        end

        context 'with one letter' do
          let(:node) { Node.new 'a' }

          it 'makes it the node letter' do
            expect(node.letter).to eq :a
          end

          it 'includes no children' do
            expect(node).to have(0).children
          end

          it 'is a terminal node' do
            expect(node).to be_terminal
          end
        end

        context 'with two letters' do
          let(:node) { Node.new 'ba' }

          it 'takes the first as the node letter' do
            expect(node.letter).to eq :b
          end

          it 'includes one child' do
            expect(node).to have(1).children
          end

          it 'includes a child with the expected letter' do
            expect(node.children.values.first.letter).to eq :a
          end

          it 'has the expected letter as a key' do
            expect(node).to have_key(:a)
          end

          it 'returns the child corresponding to the key' do
            expect(node[:a]).to eq node.children[:a]
          end

          it 'does not mark itself as a terminal node' do
            expect(node).to_not be_terminal
          end

          it 'marks the first child as a terminal node' do
            expect(node[:a]).to be_terminal
          end
        end

        context 'with a large word' do
          let(:node) { Node.new 'spaghetti' }

          it 'marks the last letter as terminal node' do
            expect(node[:p][:a][:g][:h][:e][:t][:t][:i]).to be_terminal
          end

          it 'does not mark any other letter as terminal node' do
            expect(node[:p][:a][:g][:h][:e][:t][:t]).to_not be_terminal
            expect(node[:p][:a][:g][:h][:e][:t]).to_not be_terminal
            expect(node[:p][:a][:g][:h][:e]).to_not be_terminal
            expect(node[:p][:a][:g][:h]).to_not be_terminal
            expect(node[:p][:a][:g]).to_not be_terminal
            expect(node[:p][:a]).to_not be_terminal
            expect(node[:p]).to_not be_terminal
          end
        end
      end

      describe '#as_word' do
        context 'for an empty node' do
          let(:node) { Node.new '' }

          it 'returns nil' do
            expect(node.as_word).to be_empty
          end
        end

        context 'for one letter' do
          let(:node) { Node.new 'a' }

          it 'returns the expected one letter word' do
            expect(node.as_word).to eq 'a'
          end
        end

        context 'for a small word' do
          let(:node) { Node.new 'all' }

          it 'returns the expected small word' do
            expect(node[:l][:l].as_word).to eq 'all'
          end

          it 'raises an error for a non terminal node' do
            expect { node[:l].as_word }.to raise_error InvalidOperation
          end
        end

        context 'for a long word' do
          let(:node) { Node.new 'beautiful' }

          it 'returns the expected long word' do
            expect(node[:e][:a][:u][:t][:i][:f][:u][:l].as_word).to eq 'beautiful'
          end
        end

        context 'for a node with nil letter' do
          let(:node) { Node.new nil }
          it 'returns nil' do
            expect(node.as_word).to be_empty
          end
        end
      end

      describe '#compressed?' do
        let(:root) { double 'Root' }
        let(:node) { Node.new '', root }

        context 'parent is compressed' do
          before do
            root.stub(:compressed?).and_return true
          end

          it 'returns true' do
            expect(node).to be_compressed
          end
        end

        context 'parent is not compressed' do
          before do
            root.stub(:compressed?).and_return false
          end

          it 'returns false' do
            expect(node).to_not be_compressed
          end
        end
      end
    end
  end
end