class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create!(comment_params)
    
    redirect_to @post
  end

  def edit

  	if current_user.id = @comments.user_id
  		@post =Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
	else
		render "edit", notice: 'Youre not the owner of the comment'
  end
end


  def update
  	@post =Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])

		if @comment.update(params[:comment].permit(:comment))
			redirect_to post_path(@post)
		else
			render "edit"
		end
  end


  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end