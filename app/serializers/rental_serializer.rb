class RentalSerializer < ActiveModel::Serializer
  attributes :id, :product_title, :start_date, :end_date, :total_cost, :status, :message, :created_at, :user_name

  # has_one :user, serializer: UserSerializer

  def user_name
    object.user.first_name + " " + object.user.last_name
  end

end
