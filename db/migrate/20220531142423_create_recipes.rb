class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.integer :preparation_time
      t.integer :cooking_time
      t.string :description, null: false
      t.boolean :public
      t.references :user, index:true, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
