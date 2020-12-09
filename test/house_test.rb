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

end
