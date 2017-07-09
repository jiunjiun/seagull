module Maicoins
  class Price
    BASE_URL = "https://www.maicoin.com/api/prices/%s"

    def self.btc
      new.call 'BTC', (BASE_URL % 'btc-twd')
    end

    def self.eth
      new.call 'ETH', (BASE_URL % 'eth-twd')
    end

    def call kind, url
      response = JSON.parse RestClient.get(url), symbolize_names: true
      assign kind, response
    rescue => e
      {}
    end

    def assign kind, response
      buy  = '%.2f' % (response[:raw_buy_price].to_i / 100000.0)
      sell = '%.2f' % (response[:raw_sell_price].to_i / 100000.0)
      avg  = '%.2f' % (response[:raw_price].to_i / 100000.0)

      {
        kind: kind,
        buy: buy,
        sell: sell,
        avg: avg,
      }
    end
  end
end
