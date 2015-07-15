class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.string :start_date, null: false
      t.string :end_date, null: false
      t.decimal :total_cost, null: false, :precision => 8, :scale => 2
      t.string :status, null: false
      t.text :message
      t.references :product, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
