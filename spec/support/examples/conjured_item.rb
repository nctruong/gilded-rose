module Support
  module Examples
    RSpec.shared_examples :conjured_item do
      context 'in concert' do
        it 'degrades in quality twice as fast as normal items ' do
          4.times { update_quality(items) }
          expect(item.sell_in).to eq(1)
          expect(item.quality).to eq(12)
        end
      end

      context 'out concert' do
        it 'degrades in quality twice as fast as normal items ' do
          6.times { update_quality(items) }
          expect(item.sell_in).to eq(-1)
          expect(item.quality).to eq(6)
        end
      end
    end
  end
end