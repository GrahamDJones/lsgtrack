FactoryGirl.define do
  factory :project do
    name "Time Tracker"
    state { |s| s.association(:project_state) }
  end
end
