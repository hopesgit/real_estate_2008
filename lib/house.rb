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

  def rooms_from_category(category_input)
    @rooms.find_all do |room|
      room.category == category_input
    end
  end

  def area
    @rooms.sum do |room|
      room.area
    end
  end

  def details
    Hash["price", price, "address", address]
  end

  def price_per_square_foot
    (price.to_f / area).round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort do |room|
      room.area
    end
  end

  def unique_categories
    categories = @rooms.map do |room|
      room.category
    end.uniq
  end

  def rooms_by_category
    rooms_hash = {}
    unique_categories.each do |category|
      rooms_hash[category] = rooms_from_category(category)
    end
    rooms_hash
  end
end
