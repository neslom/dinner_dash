require 'rails_helper'

RSpec.describe "Order" do
  it "shows status of order in user's order history" do
    set_cart
    visit cart_path

    click_link_or_button("Checkout")
    visit orders_path

    expect(page).to have_content("Status: ordered")
  end
end
