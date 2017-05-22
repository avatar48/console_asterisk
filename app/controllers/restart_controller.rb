class RestartController < ApplicationController
	include CurrentStatusSet
	after_action :set_status_false
  def index
  end
    def relead_config
      @ami = RubyAsterisk::AMI.new("127.0.0.1",5038)
      @ami.login("Railscall","FrUyHn6FSaX")
      @ami.command("sip reload")   
      redirect_to phones_url
    end
end
