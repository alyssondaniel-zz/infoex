include Warden::Test::Helpers
Warden.test_mode!

# Feature: Vehicle edit
#   As a user
#   I want to edit my user profile
#   So I can change my email address
feature 'Vehicle edit' do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: Vehicle changes email address
  #   Given I am signed in
  #   When I change my email address
  #   Then I see edit vehicle
  scenario 'new user changes vehicle' do
    user = build_stubbed(:user_with_role_admin)
    vehicle = create(:vehicle)
    login_as(user)
    visit edit_vehicle_path(vehicle)
    expect(page).to have_content 'Editing Vehicle'
  end

  # Scenario: Vehicle cannot edit another user's profile
  #   Given I am signed in
  #   When I try to edit another user's profile
  #   Then I not see edit vehicle
  scenario "user cannot cannot edit vehicle" do
    user = build_stubbed(:user_with_role_newuser)
    vehicle = create(:vehicle)
    login_as(user)
    visit edit_vehicle_path(vehicle)
    expect(page).to have_content 'You are not authorized to perform this action.'
  end

end
