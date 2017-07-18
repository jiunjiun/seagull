module HomeHelper
  def bitoex_format resouce
    buy        = number_to_currency resouce.buy, precision: 0, unit: ''
    sell       = number_to_currency resouce.sell, precision: 0, unit: ''
    avg        = number_to_currency resouce.avg, precision: 0, unit: ''
    created_at = resouce.created_at.strftime('%F %H:%M')

    {
      id: resouce.id,
      kind: resouce.kind,
      buy: buy,
      sell: sell,
      avg: avg,
      created_at: created_at,
    }
  end

  def maicoin_format resouces
    resouces.map do |resouce|
      buy        = number_to_currency resouce.buy, precision: 0, unit: ''
      sell       = number_to_currency resouce.sell, precision: 0, unit: ''
      avg        = number_to_currency resouce.avg, precision: 0, unit: ''
      created_at = resouce.created_at.strftime('%F %H:%M')

      {
        id: resouce.id,
        kind: resouce.kind,
        buy: buy,
        sell: sell,
        avg: avg,
        created_at: created_at,
      }
    end
  end
end
