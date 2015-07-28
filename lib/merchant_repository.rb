require_relative "sales_engine"
require_relative "merchant"

class MerchantRepository
  attr_reader :merchants
  def initialize(merchant_data, sales_engine)
    @sales_engine = sales_engine
    @merchant_data = merchant_data
    load_merchants
  end

  def load_merchants
    @merchants = {}
    merchant_data.each do |merchant|
      id = merchant[0]
      merchant_info = merchant[1]
      @merchants[id] = Merchant.new(merchant_info, self)
    end
  end

  def all

    @merchants
  end

  protected

  attr_reader :merchant_data
end
