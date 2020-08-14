class Card < ApplicationRecord
  def self.buy
  end
  belongs_to :user, foreign_key: true
  belongs_to :product, foreign_key: true
end
