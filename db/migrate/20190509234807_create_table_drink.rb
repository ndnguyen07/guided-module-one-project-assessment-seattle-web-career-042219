class CreateTableDrink < ActiveRecord::Migration[5.2]
  def change
    create_table :drinks do |t|
      t.integer :ingedients_id
      t.integer :recipe_id
    end
  end
end
