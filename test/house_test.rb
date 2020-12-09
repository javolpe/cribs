require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class RoomTest < Minitest::Test

  def test_house_exists
    house = House.new("$400000", "123 sugar lane")

    assert_instance_of House, house
  end

  def test_house_has_readable_attributes
    house = House.new("$400000", "123 sugar lane")

    assert_equal house.price, "$400000"
    assert_equal house.address, "123 sugar lane"
  end

  def test_house_starts_no_rooms
    house = House.new("$400000", "123 sugar lane")


    assert_equal house.rooms, []
  end


  def test_house_holds_proper_rooms
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    house.add_room(room_1)
    house.add_room(room_2)

    assert_equal house.rooms, [room_1, room_2]
  end

end
