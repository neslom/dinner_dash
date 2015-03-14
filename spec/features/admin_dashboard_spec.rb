require 'rails_helper'

RSpec.describe "Admin dashboard" do
  let(:admin) { create(:admin) }

  before(:each) do
    login_as(admin)
  end

  it "is directed to admin dashboard when admin logs in" do
    expect(current_path).to eq(admin_path)
    expect(page).to have_content("Admin")
    expect(page).to have_content("Successfully logged in as #{admin.username}")
  end

  it "has a link to Manage Items" do
    create(:item)

    expect(page).to have_link("Manage Items")

    click_link_or_button("Manage Items")

    expect(current_path).to eq(admin_items_path)

    expect(page).to have_link("Cheese Toast")
  end
end
