require_relative "test_helper"
require_relative "../lib/merchant_repository"
require_relative "../lib/merchant"
require_relative "../lib/sales_engine"

class MerchantRepositoryTest < Minitest::Test
  def test_it_exists
    assert MerchantRepository
  end

  def test_it_can_store_merchants
    skip
    sales_engine = SalesEngine.new("test/fixtures")
    merchant_data = sales_engine.merchant_data
    merchants = MerchantRepository.new(merchant_data, sales_engine).all

    assert_equal "Shroder", merchants.find { |merchant| merchant.name == "Schroeder-Jerde" }
  end

  def test_all_method_returns_all_merchants
    skip
    sales_engine = SalesEngine.new("test/fixtures")
    merchant_data = { name: "Schroder-something",
                      name: "Holzmann",
                      name: "Cheeck" }
    merchants = MerchantRepository.new(sales_engine, merchant_data).all
    assert merchants[:name].include?("Schroder-something")
    assert merchants[:name].include?("Holzmann")
  end

  # it can load in individual merchants into the repository
 end
