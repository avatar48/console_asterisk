module SipConfig
  extend ActiveSupport::Concern

  private
def rewrite_sip_config
      f = File.new('/etc/asterisk/sip.conf', 'w')
      @phones = Phone.all
      @setting = Setting.find_by(config: "sip.conf")
      f.puts("[#{@setting.name_option}]")
      f.puts("#{@setting.value}")
      @phones.each do |phone|
        f.puts("[#{phone.number}](phone)")
        f.puts("username=#{phone.number}")
        f.puts("secret=#{phone.password}")
        f.puts("host=dynamic")
        f.puts("context=#{phone.context.name}")
        f.puts("callerid=#{phone.callerid} <#{phone.number}>")
        f.puts
      end
      f.close  
      
    end
end
