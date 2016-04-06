require_relative '../test_helper'

class FindAllTest < WebMockingTest
  def test_find_all_ethnicities
    session = test_session
    ethnicities = HonestRenter::Ethnicity.find_all(session)
    assert_equal(Array, ethnicities.class)
    assert_equal(true,
                 ethnicities.all? { |e| e.class == HonestRenter::Ethnicity })
  end
end
