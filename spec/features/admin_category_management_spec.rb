require 'rails_helper'

RSpec.describe "Admin Category Management" do
  let(:admin) { create(:admin) }
  let!(:category_1) { create(:category) }
  let!(:category_2) { create(:category, name: "Dessert") }
  before(:each) do
    login_as(admin)
    click_link_or_button("Manage Categories")
  end

  #On the Admin Dashboard,
  #I can click a link to be taken to a Manage Categories page.
  #On the Manage Categories page,
  #I can click a link for a Category to see all of the items in that category.
  #I can click a button to remove an item from the category,
  #or I can click a button "Add Item" to add an item to the category

  it "lists all items associated with a category" do
    click_link_or_button("Entree")

    expect(current_path).to eq(admin_category_path(category_1))
    expect(page).to have_content("Manage Entree")
    expect(page).to have_content("All Items")
  end

end
