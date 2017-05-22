class UpdateSipStatusJob < ActiveJob::Base
  queue_as :high

  def perform()
		ami = RubyAsterisk::AMI.new("127.0.0.1",5038)
      	ami.login("Railscall","FrUyHn6FSaX") 
		a = ami.sip_peers.data
		peers = a[:peers]
		peers.each  do |peer|
			status_peer = peer["Status"]
			if status_peer["OK"].nil?
     			status = status_peer
     			delay = nil
     		else
       			status = status_peer["OK"]
       			delay_peer = /\d{1,}\s/.match(status_peer)
            delay = delay_peer[0]
		    end
       			status_id = Status.find_by(name: status)
			Phone.find_by(number: peer["ObjectName"]).update(status_id: status_id.id, delay: delay)
		end
  end
end
