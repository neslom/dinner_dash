def submit_order
  visit cart_path
  click_link_or_button("Checkout")
end

def view_order
  visit orders_path
end
