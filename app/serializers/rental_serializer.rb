class RentalSerializer < ActiveModel::Serializer
  attributes :id, :product_title, :start_date, :end_date, :total_cost, :status, :message, :created_at

end
