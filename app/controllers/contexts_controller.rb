class ContextsController < ApplicationController
	before_action :set_context, only: [:show, :edit, :update, :destroy]
   def index
     @contexts = Context.all
  end

  def show

  end

  def new
  	@context = Context.new
  end
  def create
  	      @context = Context.create!(user_params)
        if @context.errors.empty?
                redirect_to contexts_url
        else
                render "new"
        end
  end
  def edit
  end

   def update
    respond_to do |format|
      if @context.update(user_params)
        format.html { redirect_to context_url, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: context_url }
      else
        format.html { render :edit }
        format.json { render json: @context.errors, status: :unprocessable_entity }
      end
    end
  end

    def destroy
    @context.destroy
    respond_to do |format|
      format.html { redirect_to contexts_url, notice: ' Номер был успешно удален' }
    end
end
  private

  def set_context
  	@context = Context.find(params[:id])
  end
    def user_params
      params.require(:context).permit(:name, :out_sity)
    end

end
