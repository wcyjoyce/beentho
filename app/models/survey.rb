class Survey < ApplicationRecord
  validates :name, :start_date, :end_date, presence: true
  validates :email, presence: true, format: { with: /\A.*@.*\.com\z/ }

  PREFERENCES = ["Romantic", "Adventure", "Culture", "City", "Suitable for Children"]
  validates :preferences, inclusion: {in: PREFERENCES}

  PURPOSE = ["Business", "Family", "Honeymoon", "Stag Do / Hen Do"]
  validates :purpose, inclusion: {in: PURPOSE}

  ASIA = [
    "Afghanistan", "Armenia", "Azerbaijan",
    "Bahrain", "Bangladesh", "Bhutan", "Brunei",
    "Cambodia", "China",
    "Georgia",
    "Hong Kong",
    "India", "Indonesia", "Iran", "Iraq", "Israel",
    "Japan", "Jordan",
    "Kazakhstan", "Kuwait", "Kyrgyzstan",
    "Laos", "Lebanon",
    "Macau", "Malaysia", "Maldives", "Mongolia", "Myanmar (Burma)",
    "Nepal", "North Korea",
    "Oman",
    "Pakistan", "Palestine", "Philippines",
    "Qatar",
    "Russia",
    "Saudi Arabia", "Singapore", "South Korea", "Sri Lanka", "Syria",
    "Taiwan", "Tajikistan", "Thailand", "Timor-Leste", "Turkey", "Turkmenistan",
    "United Arab Emirates UAE)", "Uzbekistan",
    "Vietnam",
    "Yemen"
  ]
  validates :asia, inclusion: {in: ASIA}

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
