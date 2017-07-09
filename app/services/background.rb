class Background
  def self.runner
    KeyValues::Store.all.each do |store|
      store.currencies.each do |currency|
        UpdatePriceWorker.perform_async store.code, currency
      end
    end
  end
end
