require 'rails_helper'

RSpec.describe "Admin Item Management" do
  let(:admin) { create(:admin) }

  before(:each) do
    login_as(admin)
    click_link_or_button("Manage Items")
  end

  it "has a link to create an item" do
    click_link_or_button("Create Item")

    expect(current_path).to eq(new_admin_item_path)
  end

  it "fills in new item form to create a new item" do
    click_link_or_button("Create Item")
    fill_in("item[name]", with: "Beer Toast")
    fill_in("item[description]", with: "Soggy, beery toast")
    fill_in("item[price]", with: 3.50)
    click_link_or_button("Create Toast")

    expect(Item.last.name).to eq("Beer Toast")
  end

  it "cannot create an item that already exists" do
    click_link_or_button("Create Item")
    2.times do
      fill_in("item[name]", with: "Beer Toast")
      fill_in("item[description]", with: "Soggy, beery toast")
      fill_in("item[price]", with: 3.50)
      click_link_or_button("Create Toast")
    end

    expect(page).to have_content("That toast already exists")
  end

    it "has ability to update an item" do
      item = create(:item)
      click_link_or_button("Cheese Toast")
      expect(current_path).to eq(admin_item_path(item))
    end
end
