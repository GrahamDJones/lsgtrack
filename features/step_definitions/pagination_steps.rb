require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "factories"))

Then /^I should see (\d+) pages of pagination$/ do |number|
  pages = all(".pagination .page")
  pages.count.should eql(number.to_i)
end

Then /^I see page (\d+) of tickets for this project$/ do |number|
  current_page = find(".pagination .current").text.strip
  current_page.should eql(number)
end

Then /^I see page (\d+) of permissions for this user$/ do |number|
  current_page = find(".pagination .current").text.strip
  current_page.should eql(number)
end

Then /^I see page (\d+) of projects$/ do |number|
  current_page = find(".pagination .current").text.strip
  current_page.should eql(number)
end

Then /^I see page (\d+) of users$/ do |number|
  current_page = find(".pagination .current").text.strip
  current_page.should eql(number)
end

Then /^I see page (\d+) of times for this ticket$/ do |number|
  current_page = find(".pagination .current").text.strip
  current_page.should eql(number)
end
