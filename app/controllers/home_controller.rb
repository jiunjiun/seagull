class HomeController < ApplicationController
  expose :bitoex, -> { Bitoex.last }
  expose :maicoin, -> { Maicoin.where(kind: 'BTC').order(created_at: :desc).limit(1) + Maicoin.where(kind: 'ETH').order(created_at: :desc).limit(1) }

  expose :bitoex_btc_change,  -> { Bitoex.change_of_all('BTC') }
  expose :maicoin_btc_change, -> { Maicoin.change_of_all('BTC') }
  expose :maicoin_eth_change, -> { Maicoin.change_of_all('ETH') }

  def index
  end

  def price
    respond_to do |format|
      format.json
    end
  end
end
