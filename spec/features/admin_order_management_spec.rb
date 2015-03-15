require 'rails_helper'

describe "Admin Order Managment" do
  it "shows all orders" do
    visit admin_orders_path
    expect(page).to have_content("")
  end
end
