describe Vehicle do

  before(:each) { @vehicle = Vehicle.new(license_plate: "LVV-233", model: "2012", year: "2019") }

  subject { @vehicle }

  it { should respond_to(:license_plate) }
  it { should respond_to(:model) }
  it { should respond_to(:year) }

  it { should validate_presence_of(:license_plate) }
  it { should validate_presence_of(:model) }
  it { should validate_presence_of(:year) }

  it "#license_plate returns a string" do
    expect(@vehicle.license_plate).to match "LVV-233"
  end

  it "#model returns a integer" do
    expect(@vehicle.model).to match 2012
  end

  it "#year returns a integer" do
    expect(@vehicle.year).to match 2019
  end

end
