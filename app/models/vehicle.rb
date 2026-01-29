class Vehicle < ApplicationRecord
    validates :vehicle_number, presence: true
    validates :vehicle_number, format: { with: /\A[0-9A-Z]+\Z/, message: "Enter Correct Number..."}
    validates :vehicle_type, presence: true

    has_one :parking_slots

    enum :vehicle_type,{
        bike: 0,
        car: 1,
        truck: 2
    }


end
