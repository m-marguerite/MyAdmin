class StepsController < ApplicationController
  def toggle
    @step = Step.find(params[:id])
    @step.update!(checked: !@step.checked)
    respond_to do |format|
      format.turbo_stream
    end
  end
end
