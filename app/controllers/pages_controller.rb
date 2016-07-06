class PagesController < ApplicationController
  before_action :set_contact, on: [:home, :works, :services]

  def home;end

  def works;end

  def services;end

  private

  def set_contact
    @contact = Contact.new
  end
end
