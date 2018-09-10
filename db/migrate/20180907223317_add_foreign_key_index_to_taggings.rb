class AddForeignKeyIndexToTaggings < ActiveRecord::Migration[5.2]
  def change
    add_index :taggings, [:tag_id, :post_id]
  end
end
