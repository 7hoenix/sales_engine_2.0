require_relative "sales_engine"
require_relative "merchant"
require_relative "search_functions"

class MerchantRepository
  include SearchFunctions
  attr_reader :merchants

  def initialize(merchant_data, sales_engine)
    @sales_engine = sales_engine
    @merchants = merchant_data.map { |merchant_info| Merchant.new(merchant_info, self) }
  end

  def entries
    merchants
  end

  protected

  attr_reader :merchant_data
end
