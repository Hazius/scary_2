class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, except: [:create]

  # GET /comments
  # GET /comments.json
  def index
    if params[:moderating]  
        @comments = Comment.where("moderating = ?", true)
    else
        @comments = Comment.all
    end    
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create

    @comment = Comment.new(comment_params)
    if params[:commit] == "Положительный"
      @comment.liked = "true"
    elsif params[:commit] == "Отрицательный"
      @comment.liked = "false"
    end
    @comment.save
    #redirect_to @comment, notice: 'Comment was successfully created.'
    redirect_to film_path(@comment.film) 
  
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
      if @comment.update(comment_params)
        redirect_to @comment, notice: 'Comment was successfully updated.' 
      end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
      @comment.destroy
      redirect_to comments_path
  end

  private

    def admin_user  
      redirect_to(root_url) unless signed_in?
      redirect_to(root_url) unless current_user().admin?
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:user_id, :film_id, 
                     :liked, :text, :moderating) 
    end
end