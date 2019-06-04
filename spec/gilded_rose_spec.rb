require_relative './spec_helper'

describe "#update_quality" do

  let(:normal) { Item.new('Normal item', 5, 10) }
  let(:aged_brie) { Item.new('Aged Brie', 5, 10) }
  let(:sulfuras) { Item.new('Sulfuras, Hand of Ragnaros', 5, 10) }
  let(:backstage) { Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 10) }

  context "with single item" do

    context "with a normal item" do
      let(:item) { normal }
      let(:items){ [item] }
      include_examples :normal_item
    end

    context "with Aged Brie item" do
      let(:item) { aged_brie }
      let(:items){ [item] }
      include_examples :aged_brie_item
    end

    context "with Sulfuras item" do
      let(:item) { sulfuras }
      let(:items){ [item] }
      include_examples :sulfuras_item
    end

    context "with Backstage Passes item" do
      let(:item) { backstage }
      let(:items){ [item] }
      include_examples :backstage_passes_item
    end
  end

  # context "with Conjured item" do
  #   let(:item) { Item.new('Conjured', 5, 20) }
  #
  #   context 'in concert' do
  #     it 'degrades in quality twice as fast as normal items ' do
  #       4.times { update_quality([item]) }
  #       expect(item.sell_in).to eq(1)
  #       expect(item.quality).to eq(12)
  #     end
  #   end
  #
  #   context 'out concert' do
  #     it 'degrades in quality twice as fast as normal items ' do
  #       6.times { update_quality([item]) }
  #       expect(item.sell_in).to eq(-1)
  #       expect(item.quality).to eq(6)
  #     end
  #   end
  # end


  context "with multiple items" do
    let(:items) {
      [normal, aged_brie, sulfuras, backstage]
    }

    context "with a normal item" do
      let(:item) { normal }
      include_examples :normal_item
    end

    context "with Aged Brie item" do
      let(:item) { aged_brie }
      include_examples :aged_brie_item
    end

    context "with Sulfuras item" do
      let(:item) { sulfuras }
      include_examples :sulfuras_item
    end

    context "with Backstage Passes item" do
      let(:item) { backstage }
      include_examples :backstage_passes_item
    end

  end
end
