class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :author
      t.integer :post
      t.text :text

      t.timestamps
    end
    add_index :comments, :author
    add_index :comments, :post
  end
end
