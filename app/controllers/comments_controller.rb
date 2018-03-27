class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to event_path(@comment.event)
    else
      redirect_to event_path(@comment.event)
      #have to add errors here
    end
  end

  def edit
    set_comment
    @editor = true
    redirect_to event_path(@comment.event)
  end

  def update
  end

  def destroy
    set_comment
    id = @comment.event.id if @comment
    @comment.destroy
    redirect_to event_path(id)
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:event_id, :user_id, :content)
  end

end
