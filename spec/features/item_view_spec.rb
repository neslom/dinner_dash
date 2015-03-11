require 'rails_helper'

RSpec.describe "Item show" do
  it "displays item attributes" do
    visit item_path
    expect(page).to have_content("Cheese Toast")
  end
end
