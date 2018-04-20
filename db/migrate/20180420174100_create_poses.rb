class CreatePoses < ActiveRecord::Migration[5.2]
  def change
    create_table :poses do |t|
      t.string :name
      t.string :content
      t.integer :user_id
      t.integer :level_id
      t.varbinary :image
      t.timestamps
    end
  end
end
