class MemoryStrategy
  include Singleton

  def key_types
    raise NotImplementedError('Subclass must define #key_types')
  end

  def value_key_map
    raise NotImplementedError('Subclass must define #value_key_map')
  end

  def key_value_map
    raise NotImplementedError('Subclass must define #key_value_map')
  end

  def valid_key?
    raise NotImplementedError('Subclass must define #valid_key?')
  end

  def valid_values?
    raise NotImplementedError('Subclass must define #valid_values?')
  end

  def find
    raise NotImplementedError('Subclass must define #find')
  end

  def create!
    raise NotImplementedError('Subclass must define #create!')
  end

  def destroy
    raise NotImplementedError('Subclass must define #destroy')
  end
end
