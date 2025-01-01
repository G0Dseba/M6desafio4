class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_photograph

  # POST /photographs/:photograph_id/comments
  def create
    @comment = @photograph.comments.build(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @photograph, notice: 'Comentario añadido con éxito.' }
        format.json { render :show, status: :created, location: @photograph }
      else
        format.html { redirect_to @photograph, alert: 'No se pudo añadir el comentario.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_photograph
    @photograph = Photograph.find(params[:photograph_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
