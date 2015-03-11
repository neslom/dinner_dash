require 'rails_helper'

RSpec.describe "Authenticated User profile" do
  let!(:user) { create(:user) }
  let(:order) { create(:order, user_id: user.id) }
  #before(:each) { login_as(user) }

  it "can click Order History link to be taken to Order History page" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    expect(page).to have_link("Order History")

    click_link_or_button("Order History")

    expect(current_path).to eq(orders_path)

    expect(page).to have_content("#{user.username}'s Orders")
  end

  it "sees Order History" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    user.orders.create(cart: {"1" => 1})

    #create(:order, user_id: 1)

    create(:item, id: 1)

    visit orders_path

    expect(page).to have_content("Cheese Toast")
  end
end
