class StartupsController < ApplicationController
  before_action :set_contact

  def index
  end

  def mvpv1
  end

  def mvpslim
  end

  def strategycall
  end

  def mvpconcierge
  end

  def validation
  end

  private

  def set_contact
    @contact = Contact.new
  end
end
