class Card < ApplicationRecord
  def self.buy; end
  belongs_to :user
end
