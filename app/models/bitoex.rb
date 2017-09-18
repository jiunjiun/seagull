class Bitoex < ApplicationRecord
  include CalculationConcern

  validates_presence_of :kind, :buy, :sell, :avg
end
