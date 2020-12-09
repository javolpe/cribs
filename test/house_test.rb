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

  def test_false_house_above_market_average
    house = House.new("$400000", "123 sugar lane")

    assert_equal house.above_market_average?, false
  end

  def test_true_house_above_market_average?
    house = House.new("$800000", "123 sugar lane")

    assert_equal house.above_market_average?, true
  end

  def test_show_rooms_from_category_bedroom
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')
    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    assert_equal house.rooms_from_category(:bedroom), [room_1, room_2]
  end

  def test_show_rooms_from_category_basement
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')
    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    assert_equal house.rooms_from_category(:basement), [room_4]
  end

  def test_house_area
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')
    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    assert_equal house.area, 1900
  end

   def test_house_details_are_correct_and_in_hash
     house = House.new("$400000", "123 sugar lane")

     assert_equal house.details, {"price" => 400000, "address" => "123 sugar lane"}
   end

   def test_price_per_square_foot
     house = House.new("$400000", "123 sugar lane")
     room_1 = Room.new(:bedroom, 10, '13')
     room_2 = Room.new(:bedroom, 11, '15')
     room_3 = Room.new(:living_room, 25, '15')
     room_4 = Room.new(:basement, 30, '41')
     house.add_room(room_4)
     house.add_room(room_1)
     house.add_room(room_3)
     house.add_room(room_2)

     assert_equal house.price_per_square_foot, 210.53
   end



end
