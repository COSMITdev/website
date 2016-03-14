class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
  acts_as_taggable

  belongs_to :author, class_name: 'AdminUser', foreign_key: 'author_id'

  validates :hero_image, :title, :body, :slug, :publish_date, :author,
            :meta_title, :meta_description, :tag_list, :meta_tags,
            presence: true, if: 'published?'

  validates :slug, uniqueness: true

  mount_uploader :hero_image, PostUploader

  scope :published, -> { where(published: true)
                         .where('publish_date <= ?', Date.today)
                         .order(publish_date: :desc) }

  def previous
    self.class.published.where("id < ?", self.id).first
  end

  def next
    self.class.published.where("id > ?", self.id).first
  end
end
