class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false, default: "未分類"
      t.string :color_code, null: false, limit: 7, default: "#696969"

      t.timestamps
    end
  end
end
