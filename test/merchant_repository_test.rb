require_relative "test_helper"
require_relative "../lib/merchant_repository"
require_relative "../lib/merchant"
require_relative "../lib/sales_engine"

class MerchantRepositoryTest < Minitest::Test
  def test_it_exists
    assert MerchantRepository
  end

  def test_it_can_find_merchants_by_id
    sales_engine = SalesEngine.new("test/fixtures")
    data = sales_engine.merchant_data
    entries = MerchantRepository.new(data, sales_engine).all
    assert_equal "Schroeder-Jerde", entries.first.name
    assert_equal ["Wisozk, Hoeger and Bosco", ""], entries.last(2)
                                    .map { |entry| entry.name }
  end

  def test_random_returns_a_different_merchant
    sales_engine = SalesEngine.new("test/fixtures")
    data = sales_engine.merchant_data
    repository = MerchantRepository.new(data, sales_engine)

    sample_1 = repository.random
    sample_2 = repository.random
    sample_3 = repository.random

    assert sample_1 != sample_2
    assert sample_3 != sample_2
    assert sample_1 != sample_3
  end

  def test_it_can_find_a_specific_instance_by_an_id
    sales_engine = SalesEngine.new("test/fixtures")
    data = sales_engine.merchant_data
    repository = MerchantRepository.new(data, sales_engine)

    entry = repository.find_by_id(5)

    assert_equal "Williamson Group", entry.name

    entry = repository.find_by_id(75)

    assert_equal "Eichmann-Turcotte", entry.name
  end

  def test_it_can_find_a_specific_instance_by_a_name
    sales_engine = SalesEngine.new("test/fixtures")
    data = sales_engine.merchant_data
    repository = MerchantRepository.new(data, sales_engine)

    entry = repository.find_by_name("Williamson Group")

    assert_equal 5, entry.id

    entry = repository.find_by_name("Eichmann-Turcotte")

    assert_equal 75, entry.id
  end

  def test_it_can_find_all_instances_by_a_name
    sales_engine = SalesEngine.new("test/fixtures")
    data = sales_engine.merchant_data
    repository = MerchantRepository.new(data, sales_engine)

    entries = repository.find_all_by_name("Williamson Group")

    assert_equal [5, 6], entries.map { |entry| entry.id }

  end

  def test_it_can_find_by_created_at
    sales_engine = SalesEngine.new("test/fixtures")
    data = sales_engine.merchant_data
    repository = MerchantRepository.new(data, sales_engine)
#  2012-03-27 14:53:59 UTC
    entry = repository.find_by_created_at("2012-03-27 14:53:59 UTC")

    assert_equal 1, entry.id
  end

  def test_it_can_find_all_by_created_at
    sales_engine = SalesEngine.new("test/fixtures")
    data = sales_engine.merchant_data
    repository = MerchantRepository.new(data, sales_engine)
#  2012-03-27 14:53:59 UTC
    entries = repository.find_all_by_created_at("2012-03-27 14:53:59 UTC")

    assert_equal [1, 2, 3, 4, 5, 6, 7, 8, 9], entries.map { |entry| entry.id }
 end

  def test_it_can_find_by_updated_at
    sales_engine = SalesEngine.new("test/fixtures")
    data = sales_engine.merchant_data
    repository = MerchantRepository.new(data, sales_engine)

    entry = repository.find_by_updated_at("2012-03-27 14:53:59 UTC")

    assert_equal 1, entry.id
  end

  def test_it_can_find_all_by_updated_at
    sales_engine = SalesEngine.new("test/fixtures")
    data = sales_engine.merchant_data
    repository = MerchantRepository.new(data, sales_engine)

    entries = repository.find_all_by_updated_at("2012-03-27 14:53:59 UTC")

    assert_equal [1, 2, 3, 4, 5, 7, 8, 9], entries.map { |entry| entry.id }
 end
end
