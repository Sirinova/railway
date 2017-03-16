class Car < ActiveRecord::Base
  validates :car_type, presence: true
  validates :top_seat, presence: true
  validates :lower_seat, presence: true

  belongs_to :train
end
