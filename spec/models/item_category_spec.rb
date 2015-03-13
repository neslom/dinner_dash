require 'rails_helper'

RSpec.describe ItemCategory do
  it "has an item associated with a category" do
    item = create(:item)
    category = create(:category)
    category_2 = create(:category)
    item_category = create(:item_category, item_id: item.id, category_id: category.id)
    item.categories << category_2

    expect(item.categories.first).to eq(category)
    expect(item.categories.last).to eq(category_2)
  end

  it "has a category with items in it" do
    category = create(:category)
    item_1 = create(:item, name: "Dry Bread")
    item_2 = create(:item, name: "Wet Bread")
    category.items.push(item_1).push(item_2)

    expect(category.items.count).to eq(2)
    expect(category.items.first).to eq(item_1)
  end

end
