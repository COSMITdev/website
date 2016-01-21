class PortfolioPhoto < ActiveRecord::Base
  belongs_to :portfolio

  validates :portfolio_id, :description, :photo, presence: true

  mount_uploader :photo, PortfolioPhotoUploader
end
