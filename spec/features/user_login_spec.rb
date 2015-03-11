require 'rails_helper'

RSpec.describe 'User login spec' do
  let!(:user) { create(:user) }

  it "can login" do
    visit root_path

    click_link_or_button("Log in")

    expect(current_path).to eq(login_path)

    fill_in("session[username]", with: "Sally")
    fill_in("session[password]", with: "password")

    within(".form") do
      click_link_or_button("Log in")
    end

    within("#flash_notice") do
      expect(page).to have_content("Successfully logged in as #{user.username}")
    end
  end

end
