require 'test_helper'

class DataStatisticCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
