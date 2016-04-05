require_relative '../test_helper'

class FindTest < WebMockingTest
  def test_find_member
    session = test_session
    member = HonestRenter::Member.find(TEST_MEMBER_ID, session)
    assert_equal(HonestRenter::Member, member.class)
    assert_equal(TEST_MEMBER_ID, member.id)
  end
end
