class Member < ApplicationRecord
  validates_presence_of :first_name, :last_name
  belongs_to :team
  has_many :project_members, dependent: :destroy
  has_many :projects, through: :project_members

  def permitted_attributes
    [:first_name, :last_name, :city, :state, :country, :team_id]
  end

  def name
    "#{first_name} #{last_name}"
  end
end
