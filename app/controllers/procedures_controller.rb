class ProceduresController < ApplicationController
  SYSTEM_PROMPT = "Tu es un spécialiste des démarches administratives, aide moi dans ma démarche"
  def show
    @procedure = Procedure.find(params[:id])
    @message = Message.new
  end

  def index
    @procedures = Procedure.all
  end

  def create
    @procedure = Procedure.new(name: "Untitled")
    @procedure.user = current_user
    if @procedure.save
      @message = Message.new(content: params[:question])
      @message.role = "user"
      @message.procedure = @procedure
      if @message.save
        ruby_llm_procedure = RubyLLM.chat
        response = ruby_llm_procedure.with_instructions(instructions).ask(@message.content)
        Message.create(role: "assistant", content: response.content, procedure: @procedure)
        redirect_to procedure_path(@procedure)
      else
        render "procedures/index", status: :unprocessable_entity
      end
    end
  end

  private

  private
  def question_context
    params[:question]
  end

  def instructions
    [SYSTEM_PROMPT, question_context].compact.join("\n\n")
  end
end
