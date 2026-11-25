class ChecklistsController < ApplicationController
  def create
    procedure = Procedure.find(params[:procedure_id])

    @checklist = Checklist.new(
      name: "Untitle",
      description: "description"
    )
    checklist.procedure = procedure

    if @checklist.save
      redirect_to procedure_checklists_path(@checklist)
    else
      render "procedures/show", status: :unprocessable_entity
    end
  end
end
