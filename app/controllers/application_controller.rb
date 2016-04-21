class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::ParameterMissing, with: :render_404

  before_action :set_locale

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  def set_locale
    location == 'EN' # default

    begin
      location  = request.location.country_code
    rescue Errno::EHOSTUNREACH, Errno::ETIMEDOUT, Errno::ENETUNREACH, Geocoder::NetworkError
      # primary service unreachable, try secondary...
      page     = Net::HTTP.get(URI('https://geoip-db.com/json/geoip.php'))
      location = JSON.parse(page)['country_code']
      printf JSON.parse(page)['country_name']
      printf JSON.parse(page)['country_code']
      printf JSON.parse(page)['IPv4']
      printf JSON.parse(page)['city']
    end

    printf location

    I18n.locale = params[:locale] || (location == 'BR' ? :'pt-BR' : :en)
  end

  protected

  def render_404
    render 'pages/404'
  end

  def user_not_authorized
    flash[:alert] = "Você não tem permissão para fazer isso."
    redirect_to(request.referrer || root_path)
  end
end
