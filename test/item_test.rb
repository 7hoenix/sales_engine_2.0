require_relative "test_helper"
require_relative "../lib/item"

class ItemTest < Minitest::Test
  def test_it_exists
    assert Item
  end

  def test_an_item_has_a_name
    repository = "my repository"
    entry = Item.new({
      id: 1,
      name: "cake"
    }, repository)
    assert_equal "cake", entry.name
  end
end
