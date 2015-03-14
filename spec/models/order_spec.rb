require 'rails_helper'

RSpec.describe Order, type: :model do

  it "has a defualt status of ordered" do
    order = create(:order)
    expect(order.status).to eq("ordered")
  end

  it "belongs to a user" do
    user = create(:user)
    user.orders.create(status:0, cart: {"1" => 3} )
    expect(Order.first.user_id).to eq(user.id)
  end

end
