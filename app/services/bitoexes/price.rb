module Bitoexes
  class Price
    BASE_URL = "https://www.bitoex.com/sync/dashboard_fixed/%s"

    def self.btc
      new.call 'BTC', (BASE_URL % Time.now.to_i)
    end

    def call kind, url
      response = JSON.parse RestClient.get url
      assign kind, response
    rescue => e
      {}
    end

    def assign kind, response
      buy  = response[0].delete(',').to_i
      sell = response[1].delete(',').to_i
      avg  = (buy + sell) / 2

      {
        kind: kind,
        buy: buy,
        sell: sell,
        avg: avg,
      }
    end
  end
end
