module CurrentStatus
  extend ActiveSupport::Concern

  # private

    def check_status 
		@check = Checker.find_by(name: "restart_value")
    end
end