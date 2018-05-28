class ApplicationController < ActionController::Base

	add_flash_types :success, :danger, :info, :warning

	before_action :set_locale

	rescue_from CanCan::AccessDenied do |exeption|
		redirect_to root_path
		flash[:danger] = "Sorry, you are not authorized to access this page"
	end

	private

	def set_locale
		I18n.locale = params[:locale] || I18n.default_locale
	end

	def default_url_options(options = {})
		{locale: I18n.locale}.merge options
	end
end
