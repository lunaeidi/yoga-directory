class AddImageToPose < ActiveRecord::Migration[5.2]
  def change
    add_column :poses, :pic, :bytea
  end
end
