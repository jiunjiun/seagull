class HomeController < ApplicationController
  expose :bitoxe, -> { Bitoex.last }
  expose :maicoin, -> { Maicoin.where(kind: 'BTC').order(created_at: :desc).limit(1) + Maicoin.where(kind: 'ETH').order(created_at: :desc).limit(1) }

  def index
  end
end
