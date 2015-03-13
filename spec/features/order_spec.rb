require 'rails_helper'

RSpec.describe "Order" do

  it "shows status of order in user's order history" do
    user = create(:user)
    set_current_user(user)
    set_cart

    submit_order
    view_order

    expect(page).to have_content("Status: ordered")
  end

  it "shows formatted, updated at date for order" do
    user = create(:user)
    set_current_user(user)
    set_cart

    submit_order
    view_order
    expect(page).to have_content("")
  end

  it "shows line-item totals for each item" do

  end

end
