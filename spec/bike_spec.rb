require "bike"

describe Bike do
  it { is_expected.to respond_to (:working?)}
  it "reports bike when broken" do
    subject.broken?
    expect(subject.condition).to eq "Broken"
  end
  it "expects bike to work" do
    expect(subject.condition).to eq "Working"
  end
end
