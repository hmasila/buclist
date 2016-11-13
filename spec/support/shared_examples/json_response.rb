RSpec.shared_examples "a http response" do |status, message = nil|
  it "returns a status code #{status}" do
    expect(response.status).to eq(status)
  end

  it "returns a #{status} message" do
    expect(json["message"]).to eq(message)
  end if message
end
