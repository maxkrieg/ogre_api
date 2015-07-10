class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :daily_cost, :category, :image_tag
  has_many :rentals

  def image_tag
    if object.image_file_name
      "<img class='media-object' src='https://s3.amazonaws.com/mytinerary_images/medium/#{object.id}/#{object.image_file_name}'/>"
    else
      "<span></span>"
    end
  end

end
