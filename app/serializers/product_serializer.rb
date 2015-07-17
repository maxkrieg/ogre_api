class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :daily_cost, :category, :image_src, :owner_name, :owner_city, :owner_state
  has_many :rentals

  def image_src
    "https://s3-us-west-2.amazonaws.com/ogre-images/medium/#{object.id}/#{object.image_file_name}"
  end

  def owner_name
    object.user.first_name
  end

  def owner_city
    object.user.city
  end

  def owner_state
    object.user.state
  end

end
