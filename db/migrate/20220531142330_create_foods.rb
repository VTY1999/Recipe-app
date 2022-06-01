class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name, null:false
      t.integer :measurement_unit, null: false
      t.decimal :price, default: 0.0
      t.references :user, index:true, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
