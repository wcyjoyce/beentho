class Survey < ApplicationRecord
  validates :name, :start_date, :end_date, presence: true
  validates :email, presence: true, format: { with: /\A.*@.*\.com\z/ }
end
