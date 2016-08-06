class StartupsController < ApplicationController
  before_action :set_contact

  def index
  end

  def validation
  end

  def strategycall
  end

  def mvpconcierge
  end

  def mvpslim
  end

  private

  def set_contact
    @contact = Contact.new
  end
end
