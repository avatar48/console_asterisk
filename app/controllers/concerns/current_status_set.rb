module CurrentStatusSet
  extend ActiveSupport::Concern

  #private

    def set_status_ture 
		Checker.find_by(name: "restart_value").update(value: true)
    end

    def set_status_false 
		Checker.find_by(name: "restart_value").update(value: false)
    end
end