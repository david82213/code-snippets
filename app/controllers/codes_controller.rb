class CodesController < ApplicationController
  before_action :authenticate_user, only: :show

  def index
    @code = Code.new
    @languages = Language.all
    @user = current_user
    #@codes = Code.all
  end

  def create
    @code = Code.new code_params
    @code.code = @code.code.rstrip
    @code.user_id = session[:user_id]

    if @code.save
      Use.create(user: current_user, language: @code.language)

      redirect_to code_path(@code)
    else
      @languages = Language.all
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
    params.require(:code).permit(:name, :title, :code, :language_id, :user_id)
  end
end
