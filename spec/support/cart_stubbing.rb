def set_cart
  item = create(:item)
  visit item_path(item)
  click_link_or_button("Add to Cart")
end
