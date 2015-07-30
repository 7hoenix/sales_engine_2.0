module SearchFunctions
  def all
    entries
  end

  def random
    entries.sample
  end

  def find_by_id(id)
    entries.find { |entry| entry.id == id }
  end

  def find_by_name(name)
    entries.find { |entry| entry.name == name }
  end

  def find_all_by_name(name)
    entries.select { |entry| entry.name == name }
  end

  def find_by_created_at(time)
    entries.detect { |entry| entry.created_at == time }
  end

  def find_all_by_created_at(time)
    entries.select { |entry| entry.created_at == time }
  end

  def find_by_updated_at(time)
    entries.detect { |entry| entry.updated_at == time }
  end

  def find_all_by_updated_at(time)
    entries.select { |entry| entry.updated_at == time }
  end

  def find_by_unit_price(price)
    entries.detect { |entry| entry.unit_price == price }
  end

  def find_all_by_unit_price(price)
    entries.select { |entry| entry.unit_price == price }
  end

  def find_by_merchant_id(id)
    entries.detect { |entry| entry.merchant_id == id }
  end

  def find_all_by_merchant_id(id)
    entries.select { |entry| entry.merchant_id == id }
  end
end
