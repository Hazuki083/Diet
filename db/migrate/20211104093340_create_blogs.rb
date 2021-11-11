class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.integer :weight
      t.integer :body_fat
      t.text :memo
      t.string :image_id
      t.integer :user_id
      t.datetime :start_time

      t.timestamps
    end
  end
end
