class Restaurant < ActiveRecord::Base

  extend WithUserAssociationExtension

  validates :name, length: { minimum: 3 }, uniqueness: true

  has_many :reviews,
    -> { extending WithUserAssociationExtension },
    dependent: :destroy

  belongs_to :user

  def belongs_to?(current_user)
    user == current_user
  end

  def average_rating
    return 'N/A' if reviews.none?
    reviews.average(:rating).round
  end

end
