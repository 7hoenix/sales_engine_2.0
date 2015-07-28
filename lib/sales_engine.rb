require "csv"
require_relative "merchant_repository"
require_relative "merchant"
require_relative "file_io"

class SalesEngine
  DATADIRECTORY = File.expand_path("../data", __dir__)

  attr_reader :directory, :merchant_repository, :merchant_data

  def initialize(directory = DATADIRECTORY)
    @directory = directory
    @merchant_data = FileIO.new("#{directory}/merchants.csv").read_file
    @invoice_repository = {}
    @invoice_item_repository = {}
    @item_repository = {}
    @customer_repository = {}
    @transaction_repository = {}
  end

  def startup

    @merchant_repository = MerchantRepository.new(self, merchant_data)
  end

end

