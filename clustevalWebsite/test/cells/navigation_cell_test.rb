require 'test_helper'

class NavigationCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
