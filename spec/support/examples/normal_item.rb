module Support
  module Examples
    RSpec.shared_examples :normal_item do
      it 'has quality which is decreased to 9' do
        update_quality(items)
        expect(item.quality).to eq(9) # 1st day passed
      end

      it 'has the Quality of an item is never negative' do
        15.times { update_quality(items) }
        expect(item.quality).to be >= 0 # 15 days passed
      end

      it 'has quality degrades twice as fast after sell_in has passed' do
        6.times { update_quality(items) }
        expect(item.quality).to eq(3) # 6 days passed
      end
    end
  end
end