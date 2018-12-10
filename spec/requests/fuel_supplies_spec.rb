require 'rails_helper'

RSpec.describe "FuelSupplies", type: :request do
  describe "GET /fuel_supplies" do
    it "works! (now write some real specs)" do
      get fuel_supplies_path
      expect(response).to have_http_status(200)
    end
  end
end
