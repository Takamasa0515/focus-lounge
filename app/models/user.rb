class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :user_name, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\z/ }

  has_many :work_sessions, dependent: :destroy
  has_many :categories, dependent: :delete_all
  after_create :create_default_category

  private

  def create_default_category
    categories.create!(name: "未分類", system: true)
  end
end
