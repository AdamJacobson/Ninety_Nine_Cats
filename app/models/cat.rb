require 'action_view'

class Cat < ActiveRecord::Base
  include ActionView::Helpers::DateHelper

  CAT_COLORS = %w(Tiger Black Tuxedo Calico)

  has_many(
    :rental_requests,
    class_name: "CatRentalRequest",
    dependent: :destroy
  )

  validates(
    :birth_date,
    :color,
    :name,
    :sex,
    :user_id,
    :owner,
    presence: true
  )

  validates :color, inclusion: CAT_COLORS
  validates :sex, inclusion: %w(M F)

  belongs_to :owner,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  def age
    time_ago_in_words(birth_date)
  end
end
