class KeyService
  def initialize(key: nil, memory:)
    self.key = key
    self.memory = memory
  end

  def create!(key:, values:)
    validate_key(key)
    validate_values(values)
    memory.create!(key, values)
  end

  def find(key)
    memory.find(key)
  end

  private

  attr_accessor :key, :memory

  def validate_key(key)
    raise ::StandardError.new('Invalid key, Keys should be unique') unless memory.valid_key?(key, strategies: ['Uniqueness'])
  end

  def validate_values(values)
    raise ::StandardError.new('Invalid value, datatype not matching') unless memory.valid_values?(values, strategies: ['Datatype'])
  end
end
