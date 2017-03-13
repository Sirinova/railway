class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.belongs_to :train
      t.belongs_to :user
      t.belongs_to :start_station
      t.belongs_to :end_station

      t.timestamps
    end
  end
end
