class Merchant
  attr_reader :name, :id, :created_at, :updated_at

  def initialize(merchant_info, merchant_repository)
    @name = merchant_info[:name].to_s
    @id = merchant_info[:id].to_i
    @created_at = merchant_info[:created_at]
    @updated_at = merchant_info[:updated_at]
    @merchant_repository = merchant_repository
  end

  protected

  attr_reader :merchant_repository
end
