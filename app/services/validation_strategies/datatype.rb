module ValidationStrategies
  class Datatype < BaseValidationStrategy
    def perform(first, second, value_types)
      value_types[first] == nil || value_types[first] == second.class
    end
  end
end
