require 'rails_helper'

RSpec.describe Address, type: :model do
  # context "validate address" do

    it "address name validation: length is 3 to 20" do
      user = User.create(user_name: "ka", password: "123456", email: "ahfsoiashdfianhsdias", phone_number: 1234567890, alternate_number: 1234567890)
      address = Address.new(user_id: user.id, name: "Raj", contact_number: 1231231231, address: "ratlam",landmark: "asdnjasn").save
      expect(address).to eq(false)
    end

    it "address name validation: present" do
      user = User.create(user_name: "karan raj singh", password: "123456", email: "ahfsoiashdfianhsdias", phone_number: 1234567890, alternate_number: 1234567890)
      address = Address.new(user_id: user.id,contact_number: 1231231231, address: "ratlam",landmark: "asdnjasn").save
      expect(address).to eq(false)
    end

    it "ensure contact_number: presence" do
      user = User.create(user_name: "karan raj singh", password: "123456", email: "ahfsoiashdfianhsdias", phone_number: 1234567890, alternate_number: 1234567890)
      address = Address.new(user_id: user.id,name: "karan", address: "ratlam",landmark: "asdnjasn").save
      expect(address).to eq(false)
    end

    it "ensure contact_number: length is 10" do
      user = User.create(user_name: "karan raj singh", password: "123456", email: "ahfsoiashdfianhsdias", phone_number: 1234567890, alternate_number: 1234567890)
      address = Address.new(user_id: user.id, name: "karan", contact_number: 123123123, address: "ratlam",landmark: "asdnjasn").save
      expect(address).to eq(false)
    end

    it "ensure contact_number: only integer" do
      user = User.create(user_name: "karan raj singh", password: "123456", email: "ahfsoiashdfianhsdias", phone_number: 1234567890, alternate_number: 1234567890)
      address = Address.new(user_id: user.id, name: "karan", contact_number: 'a', address: "ratlam",landmark: "asdnjasn").save
      expect(address).to eq(false)
    end

    it "ensure contact_number: only integer" do
      user = User.create(user_name: "karan raj singh", password: "123456", email: "ahfsoiashdfianhsdias", phone_number: 1234567890, alternate_number: 1234567890)
      address = Address.new(user_id: user.id,name: "karan", contact_number: -1231231233, address: "ratlam",landmark: "asdnjasn").save
      expect(address).to eq(false)
    end

    it "ensure address presence" do
      user = User.create(user_name: "karan raj singh", password: "123456", email: "ahfsoiashdfianhsdias", phone_number: 1234567890, alternate_number: 1234567890)
      address = Address.new(user_id: user.id,name: "karan", contact_number: 1231231231, landmark: "asdnjasn").save
      expect(address).to eq(false)
    end

    it "ensure landmark presence" do
      user = User.create(user_name: "karan raj singh", password: "123456", email: "ahfsoiashdfianhsdias", phone_number: 1234567890, alternate_number: 1234567890)
      address = Address.new(user_id: user.id,name: "karan", contact_number: 1231231231, address: "ratlam").save
      expect(address).to eq(false)
    end

    it "ensure address_id is not associated with order while deletion" do
      user = User.create(user_name: "karan raj singh", password: "123456", email: "ahfsoiashdfianhsdias", phone_number: 1234567890, alternate_number: 1234567890)
      address = Address.create(name: "karan", contact_number: 1231231231, address: "ratlam",landmark: "asdnjasn",user_id: user.id)
      address_id = address.id
      order = Order.create(price: 123, status: "pending", user_id: user.id, address_id: address.id)
      address.destroy
      address_id = Address.find_by(id: address_id)
      expect(address_id).to eq(nil)
    end

  # end
end
