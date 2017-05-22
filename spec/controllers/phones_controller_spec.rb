require 'rails_helper'
RSpec.describe PhonesController, :type => :controller do 
	describe ".return_http_succes" do
		it '#index' do
			get :index
			# response.should be_success
			expect(response.status).to be eq(200)
		end
		it '#new' do
			get :new
			# response.should be_success
			expect(response.status).to be eq(200)
		end
		it '#create' do
			get :create
			# response.should be_success
			expect(response.status).to be eq(200)

		end

		# it "should have right phones" do
		# expect(response).to have_selector("phones", :content => Phone.all)
		
		# end
	end
	describe '#index' do
		it 'assigns new phone' do
			phone=create(:phone)
			get 'index'
			expect(assigns(:phones)).to eq ([phone])
		end

		it 'render the index template' do
			get :index
			expect(response).to render_template("index")
		end

	end
	
end