class Blog < ApplicationRecord

  validates :start_time, presence: true
  attachment :image
end
