class Portfolio < ActiveRecord::Base
  belongs_to :user
  

  validates :description, :JobTitle, :startDate, :endDate, presence: true, on: :create
  validates :description, :JobTitle, length: {minimum: 6 }, on: :create
  validate :date_validation

  def date_validation      
    if startDate != nil && endDate != nil
      if startDate > endDate 
        errors.add(:startDate, "You can't end before you start!")
      end
    end
  end
end


