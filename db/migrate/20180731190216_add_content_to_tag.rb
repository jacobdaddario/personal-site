class AddContentToTag < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :content, :string
  end
end
