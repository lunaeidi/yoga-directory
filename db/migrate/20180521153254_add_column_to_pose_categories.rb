class AddColumnToPoseCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :pose_categories, :name, :string
  end
end
