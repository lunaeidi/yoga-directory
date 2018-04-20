class AddImageToPoses < ActiveRecord::Migration[5.2]
  def change
    add_column :poses, :image, :varbinary
    end
end
