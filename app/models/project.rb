class Project < ApplicationRecord
  validates :name, presence: true
  has_many :project_members, dependent: :destroy
  has_many :members, through: :project_members

  def permitted_attributes
    [:name, member_ids: []]
  end
end
