class AddUserToCategories < ActiveRecord::Migration[7.1]
  def change
    add_reference :categories, :user, null: false, foreign_key: true
    add_column :categories, :system, :boolean, default: false, null: false
  end
end
