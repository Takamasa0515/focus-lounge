class WorkSession < ApplicationRecord
  belongs_to :user

  scope :today, -> { where(created_at: Time.zone.today.all_day) }
end
