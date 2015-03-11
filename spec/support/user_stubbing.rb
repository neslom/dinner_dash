def login_as(user)
  visit login_path

  fill_in "session[username]", with: user.username
  fill_in "session[email_address]", with: user.email_address
  fill_in "session[password]", with: user.password

  within(".login_form") do
    click_link_or_button "Log in"
  end
end

def set_current_user(user)
  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
end
