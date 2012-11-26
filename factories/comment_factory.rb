FactoryGirl.define do
  factory :comment do
    text "A plain old boring comment"
    ticket { |p| p.association(:ticket) }
    user { |u| u.association(:user) }
  end
end