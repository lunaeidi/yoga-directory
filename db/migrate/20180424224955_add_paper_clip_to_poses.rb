class AddPaperClipToPoses < ActiveRecord::Migration[5.2]
  def change
    add_attachment :poses, :image
  end
end
