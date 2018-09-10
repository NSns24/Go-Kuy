class CreateOnlineDrivers < ActiveRecord::Migration[5.0]
  def change
    create_table :online_drivers do |t|
    	t.references :driver, index: true, foreign_key: true, null: false
     	t.decimal :current_lat, null: false
      	t.decimal :current_lng, null: false
      	t.timestamps null: false
    end
  end
end
