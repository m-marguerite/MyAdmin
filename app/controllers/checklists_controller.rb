class ChecklistsController < ApplicationController

  def index
    @checklists = Checklist.all
  end

  def show
    @checklist = Checklist.find(params[:id])
  end

  # def create
  #   @procedure = Procedure.find(params[:procedure_id])
  #   checklist_json
  #   @checklist = Checklist.new(
  #     name: @procedure.name,
  #     description: @procedure.description
  #   )

  #   @checklist.procedure = @procedure

  #   if @checklist.save
  #     redirect_to checklist_path(@checklist)
  #   else
  #     render "procedures/show", status: :unprocessable_entity
  #   end
  # end
end
