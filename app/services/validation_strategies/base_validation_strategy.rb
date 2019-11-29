module ValidationStrategies
  class BaseValidationStrategy
    def perform(*)
      raise NotImplementedError('Subclasses should implement #perform')
    end
  end
end
