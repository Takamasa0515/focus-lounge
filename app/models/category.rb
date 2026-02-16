class Category < ApplicationRecord
  has_many :work_session, dependent: :destroy
  belongs_to :user
  validates :name, presence: true, uniqueness: { scope: :user }
  validates :color_code, presence: true

  before_destroy :prevent_system_destroy

  private

  def prevent_system_destroy
    if system?
      errors.add(:base, "未分類カテゴリーは削除できません")
      throw(:abort)
    end
  end
end
