class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  	include CurrentStatus
	# include ActionView::Helpers::TextHelper
before_action :authorize, :check_status
add_breadcrumb "Номера", :phones_path
add_breadcrumb "Диалпланы", :contexts_path
add_breadcrumb "Настройки sip.conf", :settings_path
add_breadcrumb "Статистика", :statictic_index_path

def authorize
	unless User.find_by(id: session[:user_id])
		redirect_to login_url, notice: "Аторизуйтесь"
		
	end
	
end

end
