class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :author
      t.integer :post

      t.timestamps
    end
    add_index :likes, :author
    add_index :likes, :post
  end
end
