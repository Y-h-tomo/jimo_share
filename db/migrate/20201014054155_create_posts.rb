class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :category
      t.text :content
      t.string :price
      t.datetime :limit
      t.string :area

      t.timestamps
    end
  end
end
