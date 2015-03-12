require 'rails_helper'

RSpec.describe "Item index" do
  let!(:item) { create(:item, id: 1, name: "Avocado Toast") }
  before(:each) { visit items_path }

  it "has a link to add item to cart" do
    expect(page).to have_button("Add to Cart")
  end

  it "can click a link to add item to cart" do
    click_button("Add to Cart")

    within("#flash_notice") do
      expect(page).to have_content("Avocado Toast")
    end
  end

end
