class User < ApplicationRecord
  rolify
  before_validation :add_default_fields
  after_create :assign_default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :admission_date, presence: true

  private
    def assign_default_role
     self.add_role(:newuser) if self.roles.blank?
    end

    def add_default_fields
      self.name ||= self.email.split('@').first
      self.admission_date ||= Date.today
    end
end
