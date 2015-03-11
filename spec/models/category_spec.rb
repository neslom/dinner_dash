require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { Category.create(name: "side dishes") }

  it "has valid attributes" do
    expect(category.name).to eq("side dishes")
  end
  
end
