class PhonesController < ApplicationController
    include CurrentStatusSet
    include SipConfig
  after_action :set_status_ture, only: [:destroy,:create, :update]
  after_action :rewrite_sip_config,  only: [:destroy,:create, :update] 
# #  before_action :nilsession, only: [:create]
#before_action :set_status_ture, only: [:create, :update]
before_action :set_phone, only: [:show, :edit, :update, :destroy]

  def index
    @phones = Phone.all
      

  end

  def new
    @phone = Phone.new
  end

  def show
    
  end

  def edit
  end

 def update
    respond_to do |format|
      if @phone.update(user_params)
        format.html { redirect_to phones_url, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: phones_url }
      else
        format.html { render :edit }
        format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /products
  # POST /products.json

  def create
    @phone = Phone.create!(user_params)
        if @phone.errors.empty?
          
                redirect_to phones_url
        else
                render "new"
        end
  end
  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @phone.destroy
    respond_to do |format|
      format.html { redirect_to phones_url, notice: "Номер #{@phone.number} был успешно удален"  }
    end

  end


  private
      def set_phone
      @phone = Phone.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:phone).permit(:number, :password, :context_id, :pickupgroup, :callgroup, :callerid)
    end
# private
#     def rewrite_sip
#       f = File.new('/etc/asterisk/sip.conf', 'w')
#       @phones = Phone.all
#       @setting = Setting.find_by(config: "sip.conf")
#       f.puts("[#{@setting.name_option}]")
#       f.puts("#{@setting.value}")
#       @phones.each do |phone|
#         f.puts("[#{phone.number}](phone)")
#         f.puts("username=#{phone.number}")
#         f.puts("secret=#{phone.password}")
#         f.puts("host=dynamic")
#         f.puts("context=#{phone.context.name}")
#         f.puts("callerid=#{phone.callerid} <#{phone.number}>")
#         f.puts
#       end
#       f.close

      
#     end

    # def relead_config
    #   @ami = RubyAsterisk::AMI.new("127.0.0.1",5038)
    #   @ami.login("Railscall","FrUyHn6FSaX")
    #   @ami.command("sip reload")   
    # end

end
