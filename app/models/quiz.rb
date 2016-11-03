class Quiz
  extend ActiveModel::Naming
  include ActiveModel::Validations
  include ActiveModel::Conversion

  attr_accessor :q1, :q2, :q3, :q4, :q5, :name, :email

  validates :q1, :q2, :q3, :q4, :q5, :name, :email, presence: true

  # validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/,
  #                     message: I18n.t('errors.messages.invalid')

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

  def percentage
    q1.to_i+q2.to_i+q3.to_i+q4.to_i+q5.to_i
  end
end
