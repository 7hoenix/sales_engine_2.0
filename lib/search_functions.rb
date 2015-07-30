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
end
