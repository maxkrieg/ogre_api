class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :city, :state, :zip
  has_many :rentals
  has_many :products

end
