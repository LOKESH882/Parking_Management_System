class ParkingSlot < ApplicationRecord
    validates :slot_number, presence: true
    validates :status, presence: true

    belongs_to :vehicle, optional: true

    enum :status, {
        available: 0,
        occupied: 1
    }
end
