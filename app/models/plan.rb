class Plan < ApplicationRecord
  
  belongs_to :user
  
  validates :start_weight, presence: true, numericality: { greater_than: 0 }
  validates :target_weight, presence: true, numericality: { greater_than: 0 }
  # numericality=属性に数値のみが使われているかを確認できる
  # greater_than=指定された値よりも大きくなければならないことを指定する
end
