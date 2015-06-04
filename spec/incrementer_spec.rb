require __dir__ + '/../incrementer.rb'

describe WebOpener::Incrementer, "when called" do
  before do
    @inc = WebOpener::Incrementer.new
  end

  it "expect to get counter" do
    expect(@inc.getCount).to eq(0)
  end

  it "expect counter increment" do
    @inc.getCount
    @inc.getCount
    @inc.getCount
    expect(@inc.getCount).to eq(3)
  end

  after do
    @inc = nil
  end
end
