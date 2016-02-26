class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
  acts_as_taggable

  belongs_to :author, class_name: 'AdminUser', foreign_key: 'author_id'

  validates :hero_image, :title, :body, :slug, :publish_date, :author,
            :meta_title, :meta_description, :tag_list, presence: true, if: 'published?'

  validates :slug, uniqueness: true

  mount_uploader :hero_image, PostUploader

  scope :published, -> { where(published: true).order(created_at: :desc) }
end
