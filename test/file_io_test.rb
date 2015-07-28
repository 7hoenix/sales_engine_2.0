require_relative "test_helper"
require_relative "../lib/file_io"

class FileIOTest < Minitest::Test
  def test_it_can_take_in_data_from_a_csv
    file_name = "test/fixtures/merchants.csv"
    inputer = FileIO.new(file_name)
    data = inputer.read_file
    assert_equal "Schroeder-Jerde", data[1][1]
  end
end
