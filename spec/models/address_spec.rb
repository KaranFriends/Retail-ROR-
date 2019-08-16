require 'rails_helper'

RSpec.describe Address, type: :model do
  context "validate user" do
    it "ensure user_id presence" do
      address = Address.new(name: "karan", contact_number: '1231231231', address: "ratlam",landmark: "asdnjasn").save
      expect(address).to eq(false)
    end
  end
end
