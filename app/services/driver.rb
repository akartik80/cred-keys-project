class Driver
  def perform
    key_service = KeyService.new(memory: InMemory.instance)

    key_service.create!(key: 'Delhi', values: { pollution_level: 'high', population: '10 Million' })


  end
end
