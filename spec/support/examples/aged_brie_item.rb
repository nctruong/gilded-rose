module Support
  module Examples
    RSpec.shared_examples :aged_brie_item do
      it 'has quality which is increased to 11 after first day' do
        update_quality(items)
        expect(item.quality).to eq(11)
      end

      it 'has the Quality of an item is never negative' do
        15.times { update_quality(items) }
        expect(item.quality).to be >= 0
      end

      it 'has quality upgrades twice as fast after sell_in has passed' do
        6.times { update_quality(items) }
        expect(item.quality).to eq(17)
      end

      it 'has Aged Brie actually increases in Quality the older it gets' do
        7.times { update_quality(items) }
        expect(item.quality).to eq(19)
      end

      it 'has the quality of item is never more than 50' do
        60.times { update_quality(items) }
        expect(item.quality).to eq(50)
      end
    end
  end
end