require 'rails_helper'

RSpec.describe "Item index" do
  let!(:item) { create(:item, id: 1, name: "Avocado Toast") }
  before(:each) { visit items_path }

  it "has a link to add item to cart" do
    expect(page).to have_button("Add to Cart")
  end

  xit "can click a link to add item to cart" do
    #allow_any_instance_of(ApplicationController).to receive(:load_cart).and_return(Cart.new({"1" => 1}))
    #expect(@cart).to be_nil
    #expect(ApplicationController.new.load_cart.content.values.reduce(:+)).to eq(1)
    #@cart = Cart.new({"1"=>1})

    click_button("Add to Cart")

    expect(@cart.content.values.reduce(:+)).to eq(2)
  end
end
