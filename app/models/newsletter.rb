class Newsletter < ActiveRecord::Base
  validates :subject, :body, presence: true

  def next
    Newsletter.where("id > ?", self.id).first
  end

  def next?
    Newsletter.where("id > ?", self.id).any?
  end
end
