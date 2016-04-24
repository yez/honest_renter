require 'rake/testtask'

task default: [:test]

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.libs << 'models'
  t.libs << 'test'
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
end

namespace :fixtures do
  desc 'reload fixtures from remote API'
  task :reload do
    fail 'No API key given' if ENV['HONEST_RENTER_API_KEY'].nil?
    fail 'No MEMBER_ID' if ENV['MEMBER_ID'].nil?
    fail 'No Secret Key' if ENV['HONEST_RENTER_SECRET_KEY'].nil?

    ethniticites_find_all = "#{ File.expand_path('..', __FILE__) }/test/fixtures/ethnicities/find_all.json"
    members_find = "#{ File.expand_path('..', __FILE__) }/test/fixtures/members/find.json"
    titles_find_all_by_filters = "#{ File.expand_path('..', __FILE__) }/test/fixtures/titles/find_all_by_filters.json"

    session = HonestRenter::Authenticator.from_secret_key_member_id(ENV['HONEST_RENTER_SECRET_KEY'], ENV['MEMBER_ID']).session

    ethniticites_find_all_results = HonestRenter::Ethnicities.find_all(session)
    members_find_results = HonestRenter::Member.find(ENV['MEMBER_ID'], session)
    filters = [HonestRenter::Filter.new(:id, 3)]
    titles_find_all_by_filters_results = HonestRenter::Title.find_all_by_filters(filters, session)

    File.open(ethniticites_find_all, 'w') { |f| f.write(JSON(ethniticites_find_all_results)) }
    File.open(members_find, 'w') { |f| f.write(JSON(members_find_results)) }
    File.open(titles_find_all_by_filters, 'w') { |f| f.write(JSON(titles_find_all_by_filters_results)) }
  end
end
