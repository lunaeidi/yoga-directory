class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :content
        t.ineger :user_id
        t.integer :pose_id
      t.timestamps
    end
  end
end
