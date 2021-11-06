class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :plans
  has_many :blog_images, dependent: :destroy

  enum sex: {man: 0, woman: 1}

  validates :name, presence: true, uniqueness: true, length: {maximum:20, minimum:2}
  validates :age, presence: true, on: :update, numericality: { only_integer: true, greater_than: 0 }
  validates :height, presence: true, on: :update, numericality: { only_integer: true, greater_than: 0 }
  validates :sex, inclusion: { in: User.sexes.keys }, on: :update

end
