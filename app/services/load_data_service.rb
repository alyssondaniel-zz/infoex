class LoadDataService
  def call
    User.find_or_create_by!(email: "admin@example.com") do |user|
      user.password = "123123"
      user.password_confirmation = "123123"
      user.add_role :admin
    end

    User.find_or_create_by!(email: "newuser@example.com") do |user|
      user.password = "123123"
      user.password_confirmation = "123123"
      user.add_role :newuser
    end

    User.find_or_create_by!(email: "employee@example.com") do |user|
      user.password = "123123"
      user.password_confirmation = "123123"
      user.add_role :employee
    end
  end
end
