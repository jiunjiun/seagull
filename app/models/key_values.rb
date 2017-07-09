module KeyValues

  class Base < ActiveHash::Base
    def self.id_options
      all.map {|t| [t.name, t.id]}
    end

    def self.code_options
      all.map {|t| [t.name, t.code]}
    end

    def self.id_hash
      Hash[*(all.map{|t| [t.id, t.name]}.flatten)]
    end

    def self.code_hash
      Hash[*(all.map{|t| [t.code, t.name]}.flatten)]
    end

    def self.attributes
      all.map {|t| t.attributes }
    end

    def self.find_by_code(code)
      super(code.to_s)
    end
  end

  class Store < KeyValues::Base
    self.data = [
      {id: 1,  code: 'Bitoex',  model: Bitoex, service: Bitoexes::Price, currencies: [:btc] },
      {id: 2,  code: 'Maicoin', model: Maicoin, service: Maicoins::Price, currencies: [:btc, :eth] },
    ]
  end

  class PriceKind < KeyValues::Base
    self.data = [
      {id: 1,  code: 'BTC',  name: 'Bitcoin'  },
      {id: 2,  code: 'ETH',  name: 'Ethereum' },
    ]
  end
end
