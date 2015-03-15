require 'rails_helper'

describe "Admin Order Management" do
  let(:admin) { create(:admin) }
  let(:user) { create(:user) }
  let!(:item) { create(:item, id: 1) }
  let!(:order) { user.orders.create(cart: {"1"=> 2 }) }

  context "when on All Orders page" do

    before(:each) do
      login_as(admin)
      visit admin_orders_path
    end

    it "shows all orders" do
      expect(page).to have_content("Manage Orders")
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

  end

  context "when on the Admin Order Dashboard" do

    before(:each) do
      login_as(admin)
      user.orders.create(status:1, cart: {"1" => 3} )
      user.orders.create(status:1, cart: {"1" => 3} )

      visit admin_orders_dashboard_path
    end

    it "shows total number of orders by status" do
      expect(page).to have_content("Ordered 1")
    end

    it "shows accurate amount of orders by status" do
      click_link_or_button("2")

      expect(page).to have_content("Manage Paid Orders")
    end

    it "states there are no orders if the status clicked on has no orders" do
      first(:link, "0").click

      expect(page).to have_content("No orders of this status")
    end
  end
end
