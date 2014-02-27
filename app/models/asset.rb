class Asset < ActiveRecord::Base
  belongs_to :hotel
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  include Rails.application.routes.url_helpers
  def to_jq_upload
    {
      "name" => read_attribute(:photo_file_name),
      "size" => read_attribute(:photo_file_size),
      "url" => photo.url(:thumb),
      "delete_url" => asset_path(self),
      "delete_type" => "DELETE"
    }
  end
end
