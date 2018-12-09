describe UserPolicy do
  subject { UserPolicy }

  let (:current_user) { build_stubbed :user }
  let (:admin) { build_stubbed :user_with_role_admin }
  let (:newuser) { build_stubbed :user_with_role_newuser }

  permissions :index? do
    it "denies access if not an admin" do
      expect(UserPolicy).not_to permit(current_user)
    end

    it "denies access if an newuser" do
      expect(UserPolicy).not_to permit(newuser)
    end

    it "allows access for an admin" do
      expect(UserPolicy).to permit(admin)
    end
  end

  permissions :show? do
    it "prevents any users from seeing user details" do
      expect(subject).not_to permit(current_user)
    end

    it "prevents new users from seeing user details" do
      expect(subject).not_to permit(newuser)
    end

    it "allows any admin to see any user details" do
      expect(subject).to permit(admin)
    end
  end

  permissions :update? do
    it "prevents updates from any users if not an admin" do
      expect(subject).not_to permit(current_user)
    end

    it "prevents updates from new users" do
      expect(subject).not_to permit(newuser)
    end

    it "allows an admin to make updates" do
      expect(subject).to permit(admin)
    end
  end

  permissions :destroy? do
    it "prevents deleting any users" do
      expect(subject).not_to permit(current_user)
    end

    it "prevents deleting new users" do
      expect(subject).not_to permit(newuser)
    end

    it "allows an admin to delete any user" do
      expect(subject).to permit(admin)
    end
  end

end
