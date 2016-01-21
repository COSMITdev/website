class Portfolio < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
  acts_as_taggable

  has_many :images, class_name: 'PortfolioPhoto'

  validates :logo, :cover, :title, :body, :working_time, :working_time_type,
            presence: true

  has_enumeration_for :working_time_type, with: PortfolioWorkingTimeType, create_helpers: true
end
