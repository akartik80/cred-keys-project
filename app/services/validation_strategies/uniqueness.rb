module ValidationStrategies
  class Uniqueness < BaseValidationStrategy
    def perform(subject, list)
      list.exclude?(subject)
    end
  end
end
