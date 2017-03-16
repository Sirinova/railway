class Car < ActiveRecord::Base
  validates :car_type, :top_seat, :lower_seat, presence: true

  belongs_to :train
end
