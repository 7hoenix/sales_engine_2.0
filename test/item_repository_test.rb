require_relative "test_helper"
require_relative "../lib/item_repository"
require_relative "../lib/item"
require_relative "../lib/sales_engine"

class ItemRepositoryTest < Minitest::Test
  def test_it_has_entries
    sales_engine = SalesEngine.new("./test/fixtures")
    data = sales_engine.item_data
    repository = ItemRepository.new(data, sales_engine)

    entries = repository.all

    assert_equal "Item Qui Esse", entries.first.name
    assert_equal ["Item Soluta Libero", ""], entries.last(2).map { |entry| entry.name }
  end

  def test_it_can_find_an_item_by_id
    sales_engine = SalesEngine.new("./test/fixtures")
    data = sales_engine.item_data
    repository = ItemRepository.new(data, sales_engine)

    entry = repository.find_by_id(5)

    assert_equal "Item Expedita Aliquam", entry.name
  end

  def test_it_can_find_an_item_by_name
    sales_engine = SalesEngine.new("./test/fixtures")
    data = sales_engine.item_data
    repository = ItemRepository.new(data, sales_engine)

    entry = repository.find_by_name("Item Expedita Aliquam")

    assert_equal 5, entry.id
  end

  def test_it_can_find_all_items_by_a_name
    sales_engine = SalesEngine.new("./test/fixtures")
    data = sales_engine.item_data
    repository = ItemRepository.new(data, sales_engine)

    entries = repository.find_all_by_name("Item Nemo Facere")

    assert_equal [4, 6], entries.map { |entry| entry.id }
  end

  def test_it_can_find_an_item_by_unit_price
    sales_engine = SalesEngine.new("./test/fixtures")
    data = sales_engine.item_data
    repository = ItemRepository.new(data, sales_engine)

    entry = repository.find_by_unit_price(4291)

    assert_equal 4, entry.id
  end

  def test_it_can_find_all_items_by_a_unit_price
    sales_engine = SalesEngine.new("./test/fixtures")
    data = sales_engine.item_data
    repository = ItemRepository.new(data, sales_engine)

    entries = repository.find_all_by_unit_price(4291)

    assert_equal [4, 37], entries.map { |entry| entry.id }
  end

  def test_it_can_find_an_item_by_merchant_id
    skip
    sales_engine = SalesEngine.new("./test/fixtures")
    data = sales_engine.item_data
    repository = ItemRepository.new(data, sales_engine)

    entry = repository.find_by_merchant_id(2)

    assert_equal "name", entry.id
  end

  def test_it_can_find_all_items_by_a_merchant_id
    skip
    sales_engine = SalesEngine.new("./test/fixtures")
    data = sales_engine.item_data
    repository = ItemRepository.new(data, sales_engine)

    entries = repository.find_all_by_merchant_id(2)

    assert_equal [4, 37], entries.map { |entry| entry.id }
  end
end
