require_relative "test_helper"
require_relative "../lib/sales_engine"

class SalesEngineTest < Minitest::Test
  def test_it_starts_up
    engine = SalesEngine.new("./test/fixtures")

    engine.startup

    assert engine.merchant_repository
    assert engine.item_repository
  end
  # it loads in and saves the repos
end

