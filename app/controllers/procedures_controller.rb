class ProceduresController < ApplicationController
  def show
    @procedure = Procedure.find(params[:id])
    @message = Message.new
  end

  def create
    @procedure = Procedure.new(name: "Untitled")
    @procedure.user = current_user

    if @procedure.save
      redirect_to procedure_path(@procedure)
    else
      render "procedures/show", status: :unprocessable_entity
    end
  end
end
