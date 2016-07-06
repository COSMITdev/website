class Subscription < ActiveRecord::Base
  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: Devise.email_regexp }
end
