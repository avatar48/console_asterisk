class SettingsController < ApplicationController
  include CurrentStatusSet
  include SipConfig
 after_action :set_status_ture, only: [:update]
 after_action :rewrite_sip_config, only: [:update]
  def index
  	@setting = Setting.find_by(config: "sip.conf") 
  end

  def edit
  	@setting = Setting.find_by(config: "sip.conf")
  end

  def show
    # @setting = Setting.find_by(config: "sip.conf")
  end
   def update
   	@setting = Setting.find_by(config: "sip.conf")
    respond_to do |format|
      if @setting.update(user_params)
        format.html { redirect_to settings_url, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: phones_url }
      else
        format.html { render :edit }
        format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end


   def user_params
      params.require(:setting).permit(:value)
   end
end
