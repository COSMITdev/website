class MvpController < ApplicationController
  def index
    @contact = Contact.new
  end
end
