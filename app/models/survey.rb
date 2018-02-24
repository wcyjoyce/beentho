class Survey < ApplicationRecord
  validates :name, :start_date, :end_date, presence: true
  validates :email, presence: true, format: { with: /\A.*@.*\.com\z/ }

  def self.to_csv
    attributes = [:created_at, :name, :email, :start_date, :end_date, :adults, :children, :purpose, :preferences, :budget, :asia, :memorable, :other]

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        csv << attributes.map{ |attr| user.send(attr) }
      end
    end
  end
end
