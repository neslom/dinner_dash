require 'rails_helper'

RSpec.describe "Order" do
  before(:each) do
    user = create(:user)
    set_current_user(user)
    set_cart

    submit_order
    view_order
  end

  it "shows status of order in user's order history" do
    expect(page).to have_content("Status: ordered")
  end

  it "shows formatted, updated at date for order" do
    expect(page).to have_content("March 14, 2015")
  end

  it "shows line-item totals for each item" do
    expect(page).to have_content("$3.00")
  end

  it "shows a total for the entire order" do
    expect(page).to have_content("$6.00")
  end

end
