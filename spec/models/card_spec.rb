require 'rails_helper'

RSpec.describe Card, type: :model do
  it "card card_holder_name validation: presence" do
    user = User.create(user_name: "ka", password: "123456", email: "ahfsoiashdfianhsdias", phone_number: 1234567890, alternate_number: 1234567890)
    card = Card.new(user_id: user.id, card_number: 1231231231, expiry: "2019-08-31", cvv: 123).save
    expect(card).to eq(false)
  end

  it "card cvv validation: presence" do
    user = User.create(user_name: "karan raj singh", password: "123456", email: "ahfsoiashdfianhsdias", phone_number: 1234567890, alternate_number: 1234567890)
    card = Card.new(user_id: user.id, card_number: 1231231231, expiry: "2019-08-31", card_holder_name: "karan").save
    expect(card).to eq(false)
  end

  it "card cvv validation: length is 3" do
    user = User.create(user_name: "karan raj singh", password: "123456", email: "ahfsoiashdfianhsdias", phone_number: 1234567890, alternate_number: 1234567890)
    card = Card.new(user_id: user.id, card_number: 1231231231, expiry: "2019-08-31", cvv: 1234, card_holder_name: "karan").save
    expect(card).to eq(false)
  end

  it "ensure expiry: presence" do
    user = User.create(user_name: "karan raj singh", password: "123456", email: "ahfsoiashdfianhsdias", phone_number: 1234567890, alternate_number: 1234567890)
    card = Card.new(user_id: user.id, card_number: 1231231231, cvv: 123,card_holder_name: "karan").save
    expect(card).to eq(false)
  end

  it "ensure card_number: presence" do
    user = User.create(user_name: "karan raj singh", password: "123456", email: "ahfsoiashdfianhsdias", phone_number: 1234567890, alternate_number: 1234567890)
    card = Card.new(user_id: user.id, expiry: "2019-08-31", cvv: 123,card_holder_name: "karan").save
    expect(card).to eq(false)
  end

  it "ensure card_number: length is 12" do
    user = User.create(user_name: "karan raj singh", password: "123456", email: "ahfsoiashdfianhsdias", phone_number: 1234567890, alternate_number: 1234567890)
    card = Card.new(user_id: user.id, card_number: 12312312, expiry: "2019-08-31", cvv: 123,card_holder_name: "karan").save
    expect(card).to eq(false)
  end

  it "ensure card_number: only_integer" do
    user = User.create(user_name: "karan raj singh", password: "123456", email: "ahfsoiashdfianhsdias", phone_number: 1234567890, alternate_number: 1234567890)
    card = Card.new(user_id: user.id, card_number: "asd", expiry: "2019-08-31", cvv: 123,card_holder_name: "karan").save
    expect(card).to eq(false)
  end

  it "ensure card_number: greater than 0" do
    user = User.create(user_name: "karan raj singh", password: "123456", email: "ahfsoiashdfianhsdias", phone_number: 1234567890, alternate_number: 1234567890)
    card = Card.new(user_id: user.id, card_number: -1231231231, expiry: "2019-08-31", cvv: 123,card_holder_name: "karan").save
    expect(card).to eq(false)
  end

  it "ensure expiry_cannot_be_in_the_past" do
    user = User.create(user_name: "karan raj singh", password: "123456", email: "ahfsoiashdfianhsdias", phone_number: 1234567890, alternate_number: 1234567890)
    card = Card.new(user_id: user.id, card_number: 1231231231, expiry: "2014-8-8", cvv: 123,card_holder_name: "karan").save
    expect(card).to eq(true)
  end

end
