class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :admin_roles, join_table: 'admin_users_admin_roles'
  has_many :posts

  def self.current
    Thread.current[:current_admin_user]
  end

  def self.current=(user)
    Thread.current[:current_admin_user] = user
  end

  def ability
    @ability ||= Ability.new(self)
  end

  delegate :can?, :cannot?, to: :ability

  def role?(role)
    admin_roles.where(name: role.to_s).exists?
  end
end
