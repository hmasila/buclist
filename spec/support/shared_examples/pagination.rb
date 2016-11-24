RSpec.shared_examples "pagination without params" do |resource|
  it_behaves_like "a http response", 200
  it "defaults and returns only the user's first 20 bucketlists" do
    expect(resource.count).to eq 150
    expect(json.count).to eql 20
  end
end

RSpec.shared_examples "pagination with invalid params" do |resource|
  let(:params) { { page: -1, limit: -10 } }
  it_behaves_like "a http response", 200
  it "defaults and returns only the user's first 20 bucketlists" do
    expect(resource.count).to eq 150
    expect(json.count).to eq 20
  end
end

RSpec.shared_examples "pagination with limit <= 100" do |resource|
  let(:params) { { page: 1, limit: 10 } }
  it_behaves_like "a http response", 200
  it "returns results limited by the pagination params" do
    expect(resource.count).to eq 150
    expect(json.count).to eq 10
  end
end

RSpec.shared_examples "pagination with limit > 100" do |resource|
  let(:params) { { page: 1, limit: 200 } }
  it_behaves_like "a http response", 200
  it "limits bucketlists returned to the first 100 on requested page" do
    expect(resource.count).to eq 150
    expect(json.count).to eq 100
  end
end
