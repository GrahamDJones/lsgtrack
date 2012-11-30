Given /^the job queue is empty$/ do
  Delayed::Job.count.should eql(0)
end

And /^the job queue should have (\d+) job in it$/ do |number|
  Delayed::Job.count.should eql(number.to_i)
end

When /^I start the job queue$/ do
  Delayed::Worker.new.work_off
end