class RentalSerializer < ActiveModel::Serializer
  attributes :id, :product_title, :start_date, :end_date, :total_cost, :status, :message, :created_at, :renter_name

  # has_one :user, serializer: UserSerializer

  def renter_name
    object.user.first_name + " " + object.user.last_name
  end

end
