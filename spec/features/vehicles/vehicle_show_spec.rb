include Warden::Test::Helpers
Warden.test_mode!

# Feature: Vehicle profile page
#   As a user
#   I want to visit my user profile page
#   So I can see my personal account data
feature 'Vehicle profile page', :devise do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: Vehicle sees own profile
  #   Given I am signed in
  #   When I visit the user profile page
  #   Then I see text Vehicle
  scenario 'new users not sees vehicle details' do
    user = build_stubbed(:user_with_role_newuser)
    vehicle = create(:vehicle)
    login_as(user)
    visit vehicle_path(vehicle)
    expect(page).to have_content 'You are not authorized to perform this action.'
  end

  # Scenario: Vehicle cannot see another user's profile
  #   Given I am signed in
  #   When I visit another user's profile
  #   Then I see an vehicle list
  scenario 'admin sees vehicle details' do
    user = build_stubbed(:user_with_role_admin)
    vehicle = create(:vehicle)
    login_as(user)
    vehicle_url = vehicle_path(vehicle)
    visit vehicle_url
    expect(page).to have_current_path(vehicle_url)
  end

end
