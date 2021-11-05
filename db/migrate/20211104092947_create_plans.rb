class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.integer :start_weight
      t.integer :target_weight
      t.timestamps
    end
  end
end
