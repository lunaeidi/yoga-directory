class CreatePoseCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :pose_categories do |t|
      t.integer :pose_id
      t.integer :category_id
    end
  end
end
