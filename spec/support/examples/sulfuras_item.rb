module Support
  module Examples
    RSpec.shared_examples :sulfuras_item do
      it 'has no sell by date nor decreases in quality - quality not affected by date' do
        60.times { update_quality(items) }
        expect(item.sell_in).to eq(-55)
        expect(item.quality).to eq(10)
      end
    end
  end
end