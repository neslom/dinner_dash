require 'rails_helper'

RSpec.describe "Cart" do
  before do
    create(:item)

    visit items_path

    click_link_or_button("Add to Cart")
  end

  it "shows a list of cart items" do
    visit cart_path

    expect(page).to have_content("Cheese Toast")
  end

  it "can remove an item from the cart" do
    visit cart_path

    click_link_or_button("Remove Item")

    within("#flash_notice") do
      expect(page).to have_content("Cheese Toast removed from cart")
    end
  end

end
