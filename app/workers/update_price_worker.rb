class UpdatePriceWorker
  include Sidekiq::Worker

  sidekiq_options retry: 1

  def perform store_code, currency
    resource = KeyValues::Store.find_by_code(store_code)
    response = resource.service.send currency
    resource.model.create! response
  end
end

