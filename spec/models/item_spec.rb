require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) { create(:item, name: "Bacon Maple Crunch",
                             description: "see name",
                             price: 8.00) }

  it "is valid" do
    expect(item).to be_valid
  end

  it "is invalid without a name" do
    item.name = nil
    expect(item).not_to be_valid
  end

end
