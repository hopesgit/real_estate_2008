require "./lib/room"

class House
  attr_reader :address, :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def price
    @price.delete("$").to_i
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    price > 500000
  end

  def rooms_by_category(category_input)
    @rooms.find_all do |room|
      room.category == category_input
    end
  end

  def area
    @rooms.sum do |room|
      room.area
    end
  end
end
