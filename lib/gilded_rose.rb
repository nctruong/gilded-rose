Dir[File.join(File.dirname(__FILE__), 'policies/*.rb')].each { |file| require file }

def update_quality(items, mapping = PoliciesMapping)
  items.collect do |item|
    item.quality = mapping.policy(item).update
    item.sell_in -= 1
  end
end

######### DO NOT CHANGE BELOW #########

Item = Struct.new(:name, :sell_in, :quality)
