require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "factories"))

Given /^there is a project called "(.*?)"$/ do |name|
  @project = FactoryGirl.create(:project, name: name)
end

Given /^there are (\d+) projects$/ do |number|
  number.to_i.times do |i|
    Project.create!(name: "Project name #{i.to_s}")
  end
end

And /^the project "(.*?)" is closed$/ do |name|
  @project = Project.find_by_name(name)
  state = ProjectState.find_by_name("Closed")
  @project.state = state
  @project.save!
end
