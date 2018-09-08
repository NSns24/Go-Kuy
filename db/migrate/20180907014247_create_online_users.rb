class CreateOnlineUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :online_users do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.decimal :pickup_lat, null: false
      t.decimal :pickup_lng, null: false
      t.decimal :dest_lat, null: false
      t.decimal :dest_lng, null: false
      t.timestamps null: false
    end
  end
end
