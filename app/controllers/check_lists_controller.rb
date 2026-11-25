class CheckListsController < ApplicationController

  def create
    procedure = Procedure.find(params[:procedure_id])

    @check_list = CheckList.new(
      name: "Untitle",
      description: "description"
    )
    check_list.procedure = procedure

    if @check_list.save
      redirect_to procedure_check_lists_path(@checklist)
    else
      render "procedures/show", status: :unprocessable_entity
    end
  end
end
