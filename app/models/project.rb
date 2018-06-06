class Project < ApplicationRecord
  validates :name , presence: true , length: {maximum: 50 }
  validates :project_number , presence: true , length: {maximum: 50 },
            uniqueness:{case_sensitive:false}
  has_many :expenses
  has_many :expense_classes
end
