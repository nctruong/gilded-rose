Dir[File.join(File.dirname(__FILE__), 'policies/*.rb')].each { |file| require file }

# @mapping: optional parameter. Define your own Mapping if don't want to use PoliciesMapping.
# This is Dependency Injection for method - not affect legacy code which involve this method.
def update_quality(items, mapping = PoliciesMapping)
  items.collect do |item|
    item.quality = mapping.policy(item).update
    item.sell_in -= 1
  end
end

######### DO NOT CHANGE BELOW #########

Item = Struct.new(:name, :sell_in, :quality)
