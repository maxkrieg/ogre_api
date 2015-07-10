class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false, index: { unique: true }
      t.string :password_digest, null: false
      t.string :token, null: false, index: { unique: true }
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip, null: false

      t.timestamps null: false
    end
  end
end
