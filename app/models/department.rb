class Department < ApplicationRecord
  validates :name , presence: true , length: {maximum: 50 }
  validates :deleted , default: false , inclusion: {in: [true, false]}
  
  # 未削除departmentスコープ
  scope :active ,-> {where(deleted:false)}
end
