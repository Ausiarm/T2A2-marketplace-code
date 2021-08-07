class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
