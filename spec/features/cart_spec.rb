require 'rails_helper'

RSpec.describe "Cart" do
  before do
    create(:item)

    visit items_path

    click_link_or_button("Add to Cart")
  end

  it "shows a list of cart items" do
    #cart = build(:cart)

    visit cart_path

    expect(page).to have_content("Cheese Toast")
  end

end
