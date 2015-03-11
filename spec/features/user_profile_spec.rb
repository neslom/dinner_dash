require 'rails_helper'

RSpec.describe "User profile" do
  let!(:user) { create(:user) }
  it "can see an order history associated with the user" do
    login_as(user)

    expect(current_path).to eq(root_path)

    expect(page).to have_link("Order History")

    click_link_or_button("Order History")

    expect(current_path).to eq(orders_path)

    expect(page).to have_content("#{user.username}'s Orders")
  end
end
