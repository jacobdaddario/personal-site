class AddForeignKeyIndexToTaggings < ActiveRecord::Migration[5.2]
  def change
    add_index :tagging, [:tag_id, :post_id]
  end
end
