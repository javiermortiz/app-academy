class CreateCatRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :cat_rentals do |t|
      t.integer :cat_id, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.string :status, default: 'PENDING'
    end
    add_index :cat_rentals, :cat_id
  end
end
