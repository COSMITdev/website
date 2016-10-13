# This Class is used to validate data for our
# Newsletter Subscribers on ActiveCampaign
class Newsletter
  extend ActiveModel::Naming
  include ActiveModel::Validations
  include ActiveModel::Conversion

  attr_accessor :name, :email

  validates :name, :email, presence: true

  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/,
                      message: I18n.t('errors.messages.invalid')

   def initialize(attributes={})
     attributes && attributes.each do |name, value|
       send("#{name}=", value) if respond_to? name.to_sym
     end
   end

  def persisted?
    false
  end

  def self.inspect
    "#<#{ self.to_s} #{ self.attributes.collect{ |e| ":#{ e }" }.join(', ') }>"
  end
end
