require_relative "../lib/search_functions"
require_relative "../lib/item"

class ItemRepository
  include SearchFunctions
  attr_reader :items

  def initialize(entries, sales_engine)
    @items = entries.map { |entry| Item.new(entry, self) }
    @sales_engine = sales_engine
  end

  def entries
    items
  end
end
