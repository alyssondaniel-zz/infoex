include Warden::Test::Helpers
Warden.test_mode!

# Feature: Vehicle index page
#   As a user
#   I want to see a list of users
#   So I can see who has registered
feature 'Vehicle index page' do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: Vehicle listed on index page
  #   Given I am signed in
  #   When I visit the vehicle index page
  #   Then I see text New Vehicle
  scenario 'admin sees list vehicles' do
    user = build_stubbed(:user_with_role_admin)
    login_as(user)
    visit vehicles_path
    expect(page).to have_current_path(vehicles_path)
  end

  # Scenario: Vehicle listed on index page
  #   Given I am signed in
  #   When I visit the vehicle index page
  #   Then Redirect to home
  scenario 'new users not sees list vehicles' do
    user = build_stubbed(:user_with_role_newuser)
    login_as(user)
    visit vehicles_path
    expect(page).to have_content 'You are not authorized to perform this action.'
  end

end
