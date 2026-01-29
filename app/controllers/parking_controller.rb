class ParkingController < ApplicationController

  def park
    vehicle = Vehicle.create(
      vehicle_number: params[:vehicle_number],
      vehicle_type: params[:vehicle_type]
    )

    slot = ParkingSlot.where(status: "available").first

    # slot = ParkingSlot.available.first

    if slot.nil?
      render json: { message: "No Slot Available" }
      return
    end

    slot.update(status: "occupied")

    render json: {
      message: "Vehicle parked",
      slot: slot.slot_number
    }
  end

  def unpark
    slot = ParkingSlot.find_by(slot_number: params[:slot_number])

    if slot.nil?
      render json: { message: "Slot not found" }
      return
    end

    slot.update(status: "available")

    render json: {
      message: "Vehicle unparked",
      slot: slot.slot_number
    }
  end

  def available_slots
    slots = ParkingSlot.where(status: "available")
    render json: slots
  end

  def occupied_slots
    slots = ParkingSlot.where(status: "occupied")
    render json: slots
  end
  
end
