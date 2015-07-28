require_relative "test_helper"
require_relative "../lib/sales_engine"

class SalesEngineTest < Minitest::Test
  def test_it_starts_up
    skip
    engine = SalesEngine.new("./test/fixtures")
    assert engine.merchant_repository
  end
  # it loads in and saves the repos
end

