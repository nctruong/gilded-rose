require 'byebug'
require_relative './lib/gilded_rose'

task :default => [:run]

task "run" do
  items = [
    Item.new('Normal item', 5, 10),
    Item.new('Aged Brie', 5, 10) ,
    Item.new('Sulfuras, Hand of Ragnaros', 5, 10) ,
    Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 10) ,
    Item.new('Conjured', 5, 20)
  ]

  print_header(0)
  print_item(items)
  (1..15).each do |i|
    update_quality(items)
    print_header(i)
    print_item(items)
  end
end

def print_header(day)
  puts sprintf("%-50s%-11s%-11s%-11s", "name", "sellIn", "quality", "day #{day}")
end

def print_item(items)
  items.each do |item|
    puts sprintf("%-50s%-11s%-11s%-11s", item.name, item.sell_in, item.quality, '')
  end
end