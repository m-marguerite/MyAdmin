class DocumentsController < ApplicationController
  def toggle
    @document = Document.find(params[:id])
    @document.update!(checked: !@document.checked)
    respond_to do |format|
      format.turbo_stream
    end
  end
end
