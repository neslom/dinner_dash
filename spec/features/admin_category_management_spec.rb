require 'rails_helper'

RSpec.describe "Admin Category Management" do
  let(:admin) { create(:admin) }

  before(:each) { login_as(admin) }

  it "exists" do
    expect(current_path).to eq(admin_path)
  end

end
