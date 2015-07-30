require "csv"

class FileIO
  def initialize(input_file)
    @input_file = input_file
  end

  def read_file
    CSV.foreach(input_file, headers: true, header_converters: :symbol)
  end

  protected

  attr_reader :input_file
end
