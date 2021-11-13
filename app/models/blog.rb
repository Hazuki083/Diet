class Blog < ApplicationRecord

  validates :weight, presence: true
  validates :body_fat, presence: true
  validates :start_time, presence: true
  attachment :image


  # scope :created_week, -> { where(created_at: Time.zone.now.all_week) } #今週
  # scope :created_onemonth, -> { where(created_at: 1.month.ago.all_month) } #1ヶ月
  # scope :created_3month, -> { where(created_at: 3.month.ago.all_month) }
  # scope :created_1year, -> { where(created_at: 1.year.ago.all_year) }


end
