require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "factories"))

Given /^there is a project called "(.*?)"$/ do |name|
  @project = FactoryGirl.create(:project, name: name)
end
