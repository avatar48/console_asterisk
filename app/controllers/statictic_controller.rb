class StaticticController < ApplicationController
  def index
  	@phones = Phone.all
   end

  def query
  	#byebug
  	start = Date.civil(params[:start_date][:year].to_i, params[:start_date][:month].to_i, params[:start_date][:day].to_i)
  	finish = Date.civil(params[:finish_date][:year].to_i, params[:finish_date][:month].to_i, params[:finish_date][:day].to_i)
  	number = params[:number] 
  	if  number == ""
  		@record = CdrRecord.where(:calldate => start..finish).page(params[:page]).per(20)
  	else
  		@record = CdrRecord.where(:calldate => start..finish, :src => number).page(params[:page]).per(20)	
  	end
  	respond_to do |format|
        format.js 
    end
  end


end
