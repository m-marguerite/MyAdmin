class ProceduresController < ApplicationController
  def show
    @procedure = Procedure.find(params[:id])
  end

  def index
    @procedures = Procedure.all
  end

  def create
    @procedure = Procedure.new(name: "Untitled")
    @procedure.user = current_user
    if @procedure.save
      redirect_to procedure_path(@procedure)
    else
      render "procedures/index"
    end
  end
end
