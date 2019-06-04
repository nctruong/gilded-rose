module Support
  module Examples
    RSpec.shared_examples :backstage_passes_item do
      it 'increase 2 when there are 10 days or less' do
        update_quality(items)
        expect(item.sell_in).to eq(9)
        expect(item.quality).to eq(12) # 1x2 + 10 = 12
      end

      it 'increase 3 when there are 5 days or less' do
        7.times { update_quality(items) }
        expect(item.sell_in).to eq(3)
        expect(item.quality).to eq(26) # 5x2 + 2x3 + 10 = 10 + 6 + 10 = 26
      end

      it 'keep increasing in the concert' do
        10.times { update_quality(items) }
        expect(item.sell_in).to eq(0)
        expect(item.quality).to eq(35) # 5x3 + 5x2 + 10 = 15 + 10 + 10 = 35
      end

      it 'drops to 0 after the concert' do
        11.times { update_quality(items) }
        expect(item.sell_in).to eq(-1)
        expect(item.quality).to eq(0)
      end
    end
  end
end