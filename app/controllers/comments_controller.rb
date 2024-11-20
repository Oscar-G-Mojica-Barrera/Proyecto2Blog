class CommentsController < ApplicationController
<<<<<<< HEAD

def create
  @article = Article.find(params[:article_id])
  @comment = @article.comments.create(comment_params)
  redirect_to article_path(@article)
end
def destroy
  @article = Article.find(params[:article_id])
  @comment = @article.comments.find(params[:id])
  @comment.destroy
  redirect_to article_path(@article)
end

private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
=======
  before_action :set_article
  before_action :set_comment, only: [:destroy, :edit, :update]
  before_action :authenticate_user!, only: [:create, :destroy]
  def create
    @comment = @article.comments.build(comment_params)
    @comment.user = current_user  # Asigna el usuario actual al comentario
    @comment.email = current_user.email 

    if @comment.save
      redirect_to @article, notice: 'Comment added successfully.'
    else
      redirect_to @article, alert: 'Failed to add comment.'
    end
  end

  def edit
    @comment = @article.comments.find(params[:id])
  end
  

  def update
    @comment = @article.comments.find(params[:id])
  
    if @comment.update(comment_params)
      redirect_to article_path(@article), notice: 'Comment was successfully updated.'
    else
      render 'edit' # Si la actualización falla, vuelve a la página de edición
    end
  end
  

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])

    if @comment.user == current_user
      @comment.destroy
      redirect_to @article, notice: 'Comment deleted successfully.'
    else
      redirect_to @article, alert: 'You are not authorized to delete this comment.'
    end
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_comment
    @comment = @article.comments.find(params[:id])
  end

end
# Permitir solo al usuario que creó el comentario realizar ciertas acciones
def authorize_user!
  unless @comment.user == current_user
    redirect_to article_path(@article), alert: 'No tienes permiso para realizar esta acción.'
  end
end

def comment_params
  # Eliminar el atributo 'commenter' ya que no lo necesitas
  params.require(:comment).permit(:body)
end

def comment_params
  params.require(:comment).permit(:commenter, :email, :body) # Agrega :email aquí
end


class CommentsController < ApplicationController
  before_action :set_article
  before_action :set_comment, only: [:destroy]
  before_action :authorize_user!, only: [:destroy]

  def destroy
    @comment.destroy
    redirect_to @article, notice: 'Comment was successfully destroyed.'
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_comment
    @comment = @article.comments.find(params[:id])
  end

  def authorize_user!
    unless @comment.user == current_user || @article.user == current_user
      redirect_to @article, alert: 'You are not authorized to delete this comment.'
    end
  end
end
>>>>>>> 734aed9 (Actualizacion final)
