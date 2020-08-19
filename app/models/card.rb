class Card < ApplicationRecord
  def self.buy; end
  belongs_to :user
  has_many :products
end
