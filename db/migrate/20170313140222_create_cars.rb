class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :car_type
      t.integer :top_seat
      t.integer :lower_seat


      t.timestamps
    end
  end
end
