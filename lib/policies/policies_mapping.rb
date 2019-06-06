# This class defined how we apply specific policy to specific item based on name or whatever we want. This class
# would be injected into update_quality method. In future, feel free to define another Mapping class if we want.
class PoliciesMapping
  class << self
    NAME_MAPPING = {
      'Aged Brie' => Policies::AgedBrie,
      'Backstage passes to a TAFKAL80ETC concert' => Policies::BackstagePasses,
      'Sulfuras, Hand of Ragnaros' => Policies::Sulfuras,
      'Conjured' => Policies::Conjured,
      '' => Policies::Standard
    }

    def policy(item)
      map_by_exact_name(item)
      # map_by_matching_name(item)
    end

    private

    def map_by_exact_name(item)
      (NAME_MAPPING[item.name] || Policies::Standard).new(item)
    end

    # Another option for matching name
    def map_by_matching_name(item)
      policy = NAME_MAPPING.select { |name, policy| item.name.include?(name) }
      policy.values.first.new(item)
    end
  end
end