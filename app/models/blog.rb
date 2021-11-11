class Blog < ApplicationRecord

  validates :weight, presence: true
  validates :body_fat, presence: true
  validates :start_time, presence: true
  attachment :image
end
