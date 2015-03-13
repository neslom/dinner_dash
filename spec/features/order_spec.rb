require 'rails_helper'

RSpec.describe "Order" do
  it "shows status of order in user's order history" do
    user = create(:user)
    set_current_user(user)
    set_cart

    visit cart_path
    click_link_or_button("Checkout")
    visit orders_path

    expect(page).to have_content("Status: ordered")
  end

  it "shows formatted, updated at date" do
    
  end
end
