class Picture < ApplicationRecord
  belongs_to :user

  has_one_attached :photo

  validates :user_id, presence: true
  validates :title, presence: true
end
