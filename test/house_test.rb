require "minitest/autorun"
require "minitest/pride"
require "./lib/house"

class HouseTest < Minitest::Test

  def test_it_is_house
    house = House.new("$400000", "123 sugar lane")

    assert_instance_of House, house
  end
end
