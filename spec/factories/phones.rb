FactoryGirl.define do	
	factory :phone do
		association(:context)
		sequence(:number) { |i| 210+i }
	    password   "password"
	    pickupgroup 1
	    callgroup 1
	    callerid "It 213"
	end
end