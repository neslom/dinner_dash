require 'rails_helper'

RSpec.describe "Browse by Category" do
  it "shows a list of Items by Category" do
    create(:category)

    visit root_path

    click_link_or_button("Entree")

    expect(current_path).to eq(items_path)
  end

end
