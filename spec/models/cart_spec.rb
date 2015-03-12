require 'rails_helper'

RSpec.describe Cart do
  let(:item_1) { create(:item, id: 1) }
  let(:item_2) { create(:item, id: 2) }

  it "has a hash of content by default" do
    cart = Cart.new(nil)
    expect(cart.content.class).to eq(Hash)
  end

  describe "#add_item" do

    it "can have items added" do
      cart = Cart.new(nil)

      cart.add_item(item_1.id)
      cart.add_item(item_1.id)
      cart.add_item(item_1.id)
      cart.add_item(item_2.id)
      cart.add_item(item_2.id)

      expect(cart.content).to eq({1 => 3, 2 => 2})
    end

  end

  describe "#remove_item" do

    it "can have items removed" do
      cart = Cart.new(nil)

      5.times { cart.add_item(item_1.id) }

      expect(cart.total_quantity).to eq(5)

      cart.remove_item(item_1.id)

      expect(cart.total_quantity).to eq(4)
    end

    it "deletes item pair from cart if the last one is removed" do
      cart = Cart.new({1 => 1})

      cart.remove_item(item_1.id)

      expect(cart.content).to be_empty

    end

  end

  describe "#total_quantity" do

    it "returns total number of items in cart" do
      cart = Cart.new(nil)

      5.times { cart.add_item(item_1.id) }

      expect(cart.total_quantity).to eq(5)
    end

  end

end
