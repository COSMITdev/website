class PreSaleCustomerPagesController < ApplicationController
  def show
    @page = PreSaleCustomerPage.friendly.find(params[:id])
  end
end
