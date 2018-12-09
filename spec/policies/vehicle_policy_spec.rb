describe VehiclePolicy do
  subject { VehiclePolicy }

  let (:newuser) { build_stubbed :user_with_role_newuser }
  let (:admin) { build_stubbed :user_with_role_admin }

  permissions :index? do
    it "denies access if not an admin" do
      expect(VehiclePolicy).not_to permit(newuser)
    end

    it "denies access if an newuser" do
      expect(VehiclePolicy).not_to permit(newuser)
    end

    it "allows access for an admin" do
      expect(VehiclePolicy).to permit(admin)
    end
  end

  permissions :show? do
    it "prevents any users from seeing user details" do
      expect(subject).not_to permit(newuser)
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
      expect(subject).not_to permit(newuser)
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
      expect(subject).not_to permit(newuser)
    end

    it "prevents deleting new users" do
      expect(subject).not_to permit(newuser)
    end

    it "allows an admin to delete any user" do
      expect(subject).to permit(admin)
    end
  end

end
