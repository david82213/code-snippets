class CodesController < ApplicationController
  def index
    @code = Code.new
    @languages = Language.all
    @codes = Code.all
  end

  def create
    @code = Code.new code_params
    @code.code = "```#{@code.language.kind}\r\n#{@code.code}"

    if @code.save
      redirect_to code_path(@code)
    else
      render :index
    end
  end

  def show
    @code = Code.find params[:id]
  end

  def edit
    @code = Code.find params[:id]
  end

  private

  def code_params
    params.require(:code).permit(:kind, :title, :code, :language_id)
  end
end