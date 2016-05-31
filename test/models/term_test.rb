require 'test_helper'

class TermTest < ActiveSupport::TestCase

  test "valid term" do
    term = terms(:active_term)
    assert term.valid?
    assert term.courses.count > 0
  end
end
