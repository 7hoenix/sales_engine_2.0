class Merchant
  attr_reader :name

  def initialize(merchant_info, merchant_repository)
    @merchant_repository = merchant_repository
    @merchant_info = merchant_info
  end

  def id
    merchant_info[0]
  end

  def name
    merchant_info[1][:name]
  end

  def created_at
    merchant_info[1][:created_at]
  end

  def updated_at
    merchant_info[1][:updated_at]
  end

  protected

  attr_reader :merchant_info, :merchant_repository
end
