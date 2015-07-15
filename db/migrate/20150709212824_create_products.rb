class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.text :description
      t.string :daily_cost, null: false
      t.string :category, null: false
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
