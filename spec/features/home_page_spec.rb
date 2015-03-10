require 'rails_helper'

RSpec.describe "Home page" do
  context "as an unauthenticated user" do
    it "shows a link to browse all items" do
      visit root_path

      expect(page).to have_link("Browse All Items", href: items_path)
    end

    it "shows a link to browse by category" do
      visit root_path

      expect(page).to have_link("Browse By Category", href: categories_path)
    end
  end
end
