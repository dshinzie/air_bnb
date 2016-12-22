require 'rails_helper'

describe "When a user goes to login page" do
  it "the user can login with their credentials" do
    user = User.create(email: "brad@test.com", password: "password", first_name: "Chase", last_name: "Dun", phone: "7273840")

    visit "/login"

    fill_in "Email", with: "brad@test.com"
    fill_in "Password", with: "password"
    require "pry"; binding.pry

    click_button "Login"

    expect(current_path).to eq(dashboard_path(user.slug))
    expect(page).to have_content("Chase")
  end

  it "the user cannot login with wrong credentials" do
    user = User.create(email: "brad@test.com", password: "password", first_name: "Chase", last_name: "Dun", phone: "7273840")

    visit "/login"

    fill_in "Email", with: "brad@test.com"
    fill_in "Password", with: "wrongpassword"

    click_link "Login"

    expect(current_path).to eq("/login")
  end
end
