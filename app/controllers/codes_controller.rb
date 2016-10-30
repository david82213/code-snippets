class CodesController < ApplicationController
  def index
    @code = Code.new
    @languages = Language.all
    #@codes = Code.all
  end

  def create
    @code = Code.new code_params
    @code.code = @code.code

    if @code.save
      redirect_to code_path(@code)
    else
      render :index
    end
  end

  def show
    @code = Code.find params[:id]
    @languages = Language.all
  end

  def edit
    @code = Code.find params[:id]
    @languages = Language.all
  end
  
  def update
    @code = Code.find params[:id]
    if @code.update code_params
      redirect_to code_path(@code), notice: "Code: #{@code.title} is updated"
    else
      flash.now[:alert] = 'Please see error(s) below'
      render :edit
    end  
  end
  
  def destroy
    code = Code.find params[:id]
    if code.destroy
      redirect_to root_path, notice: "You have deleted #{code.title}"
    else
      render :edit, notice: "Something went wrong, failed to delete this code snippet."
    end
    
  end
  
  private

  def code_params
    params.require(:code).permit(:name, :title, :code, :language_id)
  end
end
