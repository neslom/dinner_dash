require 'rails_helper'

describe "Admin Order Managment" do
  let(:admin) { create(:admin) }
  let(:user) { create(:user) }
  let!(:item) { create(:item, id: 1) }
  let!(:order) { user.orders.create(cart: {"1"=> 2 } ) }

  before(:each) do
    login_as(admin)
    visit admin_orders_path
  end

  it "shows all orders" do
    expect(page).to have_content("Manage all orders")
    expect(page).to have_content(order.id)
  end

  it "links to a single order view" do
    click_link_or_button(order.id.to_s)
    expect(page).to have_content(order.user.username)
  end

  it "shows all items and their information" do
    click_link_or_button(order.id.to_s)
    expect(page).to have_link("Cheese Toast")
    expect(page).to have_content("ordered")
    expect(page).to have_content(order.created_at)
    expect(page).to have_content(order.total)
  end

  it "shows total number of orders by status" do
    expect(page).to have_content("Ordered: 1")
  end
end
