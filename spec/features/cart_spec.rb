require 'rails_helper'

RSpec.describe "Cart" do
  before(:each) do
    create(:item)

    visit items_path

    click_link_or_button("Add to Cart")
  end

  it "shows a list of cart items" do
    visit cart_path

    expect(page).to have_content("Cheese Toast (1)")
  end

  it "can remove an item from the cart" do
    visit cart_path

    click_link_or_button("Remove Item")

    within("#flash_notice") do
      expect(page).to have_content("Cheese Toast removed from cart")
    end
  end

  it "can increase an item's quantity in the cart" do
    visit cart_path

    click_link_or_button("Add Item")

    within("#flash_notice") do
      expect(page).to have_content("Cheese Toast added to cart")
    end
  end

  it "can checkout cart" do
    #     I can review my cart contents,
    # and I click submit
    # I can know see that order,
    # in my order history,
    # and that order has a status of ordered.

    #visit page
    #click checkout button
    #see confirmation message
    #visit order history page
    #expect to see that order with status of ordered
    
  end

end
