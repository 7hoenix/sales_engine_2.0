require "bigdecimal"

class Item
  attr_reader :id,
              :name,
              :description,
              :unit_price,
              :merchant_id,
              :created_at,
              :updated_at

  def initialize(data, repository)
    @id = data[:id].to_i
    @name = data[:name].to_s
    @description = data[:description].to_s
    @unit_price = BigDecimal.new(data[:unit_price].to_s)
    @merchant_id = data[:merchant_id]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
  end
end
