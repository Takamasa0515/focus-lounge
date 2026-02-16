class RemoveDefaultFromCategoriesName < ActiveRecord::Migration[7.1]
  def change
    change_column_default :categories, :name, nil
    change_column_default :categories, :color_code, "#ffffff"
  end
end
