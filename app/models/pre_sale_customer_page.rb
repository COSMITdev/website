class PreSaleCustomerPage < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug, use: [:slugged, :finders]
  validates :slug, :video, :banner, presence: true
  validates :slug, uniqueness: true

  mount_uploader :banner, PostUploader
end
