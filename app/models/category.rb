class Category < ApplicationRecord
  has_many :work_session, dependent: :destroy

  validates :name, presence: true
  validates :color_code, presence: true
end
