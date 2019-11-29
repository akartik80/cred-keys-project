module ValidationStrategies
  class Datatype < BaseValidationStrategy
    def perform(subject, list)
      return true if ValidationStrategies::Uniqueness.new.perform(subject, list.keys)
      debugger
      list[subject] == subject.class
    end
  end
end
