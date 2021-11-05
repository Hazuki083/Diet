class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.integer :weight
      t.integer :body_fat
      t.text :memo
      t.text :image_id

      t.timestamps
    end
  end
end
