class Team < ApplicationRecord
  validates :name, presence: true
  has_many :members, dependent: :destroy

  def permitted_attributes
    [:name]
  end
end
