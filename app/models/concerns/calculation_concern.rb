module CalculationConcern
  extend ActiveSupport::Concern

  module ClassMethods
    def change_of_all kind
      {
        day: change_of_day(kind),
        minute_30: change_of_30_minute(kind),
      }
    end

    def change_of_day kind
      change kind, 1.days
    end

    def change_of_30_minute kind
      change kind, 30.minutes
    end

    def change kind, range_time
      open_by_time = self.where(kind: kind).where('created_at >= ?', Time.now - range_time)
      first        = open_by_time.first
      last         = self.where(kind: kind).last

      buy_change  = ( last.buy - first.buy ) / first.buy * 100
      sell_change = ( last.sell - first.sell ) / first.sell * 100

      {
        buy: {
          change: buy_change,
          status: (buy_change >= 0 ? 'rise' : 'fall' ),
          height: open_by_time.maximum(:buy),
          low: open_by_time.minimum(:buy)
        },
        sell: {
          change: sell_change,
          status: (sell_change >= 0 ? 'rise' : 'fall' ),
          height: open_by_time.maximum(:sell),
          low: open_by_time.minimum(:sell)
        }
      }
    rescue
      nil
    end
  end
end

