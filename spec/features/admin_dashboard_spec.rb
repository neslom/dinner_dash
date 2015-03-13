require 'rails_helper'

RSpec.describe "Admin dashboard" do
  it "is directed to admin dashboard when admin logs in" do
    admin = create(:admin)
    login_as(admin)

    expect(current_path).to eq(admin_path)
  end
end
