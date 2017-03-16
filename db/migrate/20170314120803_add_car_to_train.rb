class AddCarToTrain < ActiveRecord::Migration[5.0]
  def change
    add_belongs_to :cars, :train
  end
end
