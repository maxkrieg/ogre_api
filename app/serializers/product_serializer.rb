class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :daily_cost, :category, :image_src
  has_many :rentals

  def image_src
    'https://s3.amazonaws.com/ogre-images/medium/#{object.id}/#{object.image_file_name}'
  end

end
