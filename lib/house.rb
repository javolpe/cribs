require './lib/room'

class House
  attr_accessor :rooms

  attr_reader   :price,
                :address


  def initialize(price, address)
    @price   = price
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    price_integer = @price.gsub("$", "")

    if price_integer.to_i > 500000
      true
    elsif price_integer.to_i < 500000
      false
    end
  end

  def rooms_from_category(category)
    category_holder = []
      rooms.each do |room|
        if room.category == category
          category_holder << room
        end
      end
      category_holder
  end

  def area
    total_area = 0
    rooms.each do |room|
      total_area += room.area
    end
    total_area
  end

  def details
    details_hash = Hash.new(0)
      price_integer = @price.gsub("$", "")
      details_hash["price"]   = price_integer.to_i
      details_hash["address"] = @address

    details_hash
  end

  def price_per_square_foot
    price_integer = @price.gsub("$", "")
    price_integer = price_integer.to_f

    final = price_integer / area
    final.round(2)
  end


  def rooms_sorted_by_area
    i = 0
    counter = rooms.count - 1
        rooms = @rooms
      counter.times do
        if rooms[i].area < rooms[i+1].area
         rooms[i], rooms[i+1] = rooms[i+1], rooms[i]
        end
        i+=1
      end
      rooms
  end




end
