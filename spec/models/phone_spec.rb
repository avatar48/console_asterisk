require 'rails_helper'

describe Phone do
	it "should do something" do
		phone = create(:phone)
		phone.valid?
		#expect(phone.errors[:number]).not_to be_empty 
		#expect(phone.errors[:password]).not_to be_empty 
	end
end