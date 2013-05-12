require 'test_helper'

class InfoTextCellTest < Cell::TestCase
  test "display" do
    invoke :display
    assert_select "p"
  end
  

end
