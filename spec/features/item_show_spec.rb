require 'rails_helper'

RSpec.describe "Item show" do
  let(:item) { create(:item) }

  it "displays item title" do
    visit item_path(item)
    within('.item-title') do
      expect(page).to have_content("Cheese Toast")
    end
  end

  it "displays item description" do
    visit item_path(item)
    within(".item-description") do
      expect(page).to have_content("Super cheesy bread food")
    end
  end

  it "display items price" do
    visit item_path(item)
    within(".item-price") do
      expect(page).to have_content("3.00")
    end
  end

  it "can click a link to add item to cart" do
    #allow_any_instance_of(ApplicationController).to receive(:load_cart).and_return(Cart.new({"1" => 1}))
    #expect(@cart).to be_nil
    #expect(ApplicationController.new.load_cart.content.values.reduce(:+)).to eq(1)
    #@cart = Cart.new({"1"=>1})
    #good in controller test

    visit item_path(item)
    expect(page).to have_button("Add to Cart")
    click_link_or_button("Add to Cart")
    expect(current_path).to eq(items_path)
    expect(page).to have_selector("#flash_success")
  end

end
