class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  DEFAULT_PAGE = 0

  def page
    params[:page] || DEFAULT_PAGE
  end

  def per_page
    params[:per_page] || Spree::Config[:admin_products_per_page]
  end
end
