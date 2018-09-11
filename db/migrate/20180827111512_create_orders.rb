class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :driver, index: true, foreign_key: true, null: false
      t.references :user, index: true, foreign_key: true, null: false
      t.decimal :pickup_lat, null: false
      t.decimal :pickup_lng, null: false
      t.decimal :dest_lat, null: false
      t.decimal :dest_lng, null: false
      t.decimal :distance, null: false
      t.integer :rating
      t.string :comment
      t.datetime :pickup_datetime
      t.datetime :finish_datetime
      t.timestamps null: false
    end
  end
end
