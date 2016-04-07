require_relative '../test_helper'

class FindAllByFiltersTest < WebMockingTest
  def test_find_all_titles_by_filters
    session = test_session
    filters = [HonestRenter::Filter.new(:id, TEST_TITLES_ID)]
    titles = HonestRenter::Title.find_all_by_filters(filters, session)
    assert_equal(Array, titles.class)
    assert_equal(true,
                 titles.all? { |e| e.class == HonestRenter::Title })
  end
end
