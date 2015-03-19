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
      expect(page).to have_content("all")
      expect(page).to have_content("less than a minute ago")
      expect(page).to have_link("#{order.id}")
    end

    it "links to a single order view" do
      click_link_or_button("#{order.id}")

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

  context "when on the Admin Order index page" do
      self.use_transactional_fixtures = false

    before(:each) do
      user.orders.create(id: 11, status:1, cart: {"1" => 3} )
      user.orders.create(id: 12, status:1, cart: {"1" => 3} )
      login_as(admin)

      visit admin_orders_path
    end

    it "shows total number of orders by status", js: true do
      # need to select ordered from the dropdown
      # then expect page to have one of status Ordered
        select("ordered", from: "order_filter_status")

      within(".orders") do
        expect(page).to have_link("#{order.id}")
        expect(page).to_not have_link("12")
      end
    end

    xit "shows accurate amount of orders by status" do
      click_link_or_button("2")

      expect(page).to have_content("Manage Paid Orders")
    end

    xit "states there are no orders if the status clicked on has no orders" do
      first(:link, "0").click

      expect(page).to have_content("No orders of this status")
    end

  end

  context "when viewing an individual order" do
    before(:each) do
      login_as(admin)
      user.orders.create(id: 13, status:1, cart: {"1" => 3} )
      user.orders.create(id: 21, status:1, cart: {"1" => 3} )

      visit admin_orders_path
      click_link_or_button("2")
    end

    xit "can change an order's status" do
      order_21 = user.orders.find(21)
      click_link_or_button("21")

      expect(current_path).to eq(admin_order_path(order_21))
      expect(order_21.status).to eq("paid")

      within("#completed") do
        choose("order[status]")
      end
      click_link_or_button("Submit")

      expect(page).to have_content("Success")
    end
  end
end
