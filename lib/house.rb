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



end
