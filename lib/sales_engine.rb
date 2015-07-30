require "csv"
require_relative "merchant_repository"
require_relative "item_repository"
require_relative "merchant"
require_relative "item"
require_relative "file_io"

class SalesEngine
  DATADIRECTORY = File.expand_path("../data", __dir__)

  attr_reader :directory,
              :merchant_repository,
              :item_repository,
              :merchant_data,
              :item_data

  def initialize(directory = DATADIRECTORY)
    @directory = directory
    @merchant_data = FileIO.new("#{directory}/merchants.csv").read_file
    @invoice_repository = {}
    @invoice_item_repository = {}
    @item_data = FileIO.new("#{directory}/items.csv").read_file
    @customer_repository = {}
    @transaction_repository = {}
  end

  def startup
    @merchant_repository = MerchantRepository.new(merchant_data, self)
    @item_repository = ItemRepository.new(item_data, self)
  end

end

