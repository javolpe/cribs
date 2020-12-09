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
    if price.to_i > 500000
      true
    elsif price.to_i < 500000
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




end
