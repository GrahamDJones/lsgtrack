require "spec_helper"

describe "rate limiting", type: :api do
  let(:user) { create_user! }

  it "counts the user's request" do
    user.request_count.should eql(0)
    get "/api/v2/projects.json", token: user.authentication_token
    user.reload
    user.request_count.should eql(1)
  end

  it "stops a user if they have exceeded the limit" do
    user.update_attribute(:request_count, 200)
    get "/api/v2/projects.json", token: user.authentication_token
    response.status.should eql(403)
    error = {error: "Rate limit exceeded."}
    response.body.should eql(error.to_json)
  end
end