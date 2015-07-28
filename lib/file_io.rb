require "csv"

class FileIO
  def initialize(input_file)
    @input_file = input_file
  end

  def read_file
    CSV.read(input_file)
  end

  protected

  attr_reader :input_file
end
