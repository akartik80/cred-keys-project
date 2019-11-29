class InMemory < MemoryStrategy
  def initialize
    self.value_types = {}
    self.key_value_map = {}
    self.value_key_map = {}
  end

  attr_accessor :value_types, :value_key_map, :key_value_map

  def valid_key?(key, strategies: nil)
    return true unless strategies.present?

    strategies.each do |strategy|
      strategy_class = "ValidationStrategies::#{strategy}".constantize.new
      next Rails.logger.error("Strategy #{strategy} not present") unless strategy_class.present?

      validated = strategy_class.perform(key, key_value_map.keys)
      return false unless validated
    end

    true
  end

  def valid_values?(values, strategies: nil)
    return true unless strategies.present?

    strategies.each do |strategy|
      strategy_class = "ValidationStrategies::#{strategy}".constantize.new
      next Rails.logger.error("Strategy #{strategy} not present") unless strategy_class.present?

      values.each do |value|
        validated = (value_types[value.first] == value.second.class || value_types[value.first] == nil)
        # validated = strategy_class.perform(value.second, value.)
        return false unless validated
      end
    end

    true
  end

  def create!(key, values = {})
    ActiveRecord::Base.transaction do
      key_value_map[key] = values

      values.each do |value|
        value_key_map[value.first] ||= {}
        value_key_map[value.first][value.second] ||= []
        value_key_map[value.first][value.second] << key

        value_types[value.first] = value.second.class
      end
    end
  end

  def find(key)
    key_value_map[key]
  end

  def destroy(key)
    return unless key_value_map[key].present?

    key_value_map[key].each do |value|
      value_key_map[value.first][value.second].delete(key)
    end
  end
end
