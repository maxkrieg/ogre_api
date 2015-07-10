class Product < ActiveRecord::Base
  belongs_to :user
  has_many :rentals

  has_attached_file :image,
    :styles => { :large => "200x200#", :medium => "150x150#" },
    :processors => [:thumbnail],
    storage: :s3,
    path: "/:style/:id/:filename",
    s3_credentials: {
      bucket: ENV['BUCKET'],
      :access_key_id => ENV['ACCESS_KEY_ID'],
      :secret_access_key => ENV['SECRET_KEY']}

  # validates :image, presence: true
  # validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  # validates_with AttachmentSizeValidator, :attributes => :image, :less_than => 100.megabytes

end
