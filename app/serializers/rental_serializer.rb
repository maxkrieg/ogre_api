class RentalSerializer < ActiveModel::Serializer
  attributes :id, :product_name, :start_date, :end_date, :total_cost, :status, :message, :created_at, :renter_name, :owner_name, :owner_email

  # has_one :user, serializer: UserSerializer

  def renter_name
    object.user.first_name + " " + object.user.last_name
  end

  def product_name
    object.product.title
  end

  def owner_name
    object.product.user.first_name
  end

  def owner_email
    object.product.user.email
  end

end
