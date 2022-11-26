class Api::V1::CommentsController < ApplicationController
  before_action :set_article
  before_action :set_comment, only: %i[ show update destroy ]

  # GET /api/v1/comments
  def index
    @article = Article.find(params[:id])
    render json: { status: 'OK' , data: @article.comments }
    # @comments = @article.comments
    # render json: { status: 'OK', data: @comments }
  end

  # GET /api/v1/comments/1
  # def show
  #   render json: @api_v1_comment
  # end

  # POST /api/v1/comments
  def create
    @article = Article.find(params[:id])
    @article_comment = @article.comments.create(comment_params[:attributes])
    @article_comment.author_id = @current_author.id
    @article_comment.save
    render json: response_params(@article.comments.last), status: 'OK'

    # if @comment.save
    #   render json: @comment, status: :created
    # else
    #   render json: @comment.errors, status: :unprocessable_entity
    # end
  end

  # PATCH/PUT /api/v1/comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment, status: :ok
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/comments/1
  def destroy
    if @comment.destroy
      render json: { status: "Delete" }, status: :ok
    else
      render json: @comment.errors, status: :unprocessable_entity
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find_by_id(params[:article_id])
      render json: {
        error: 'not found'
      }, status: 404 if @article.nil?
    end

    def set_comment
      @comment = Comment.find(params[:id])
      render json: {
        error: 'not found'
      }, status: 404 if @comment.nil?
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.permit(:body, :status)
      # params.fetch(:api_v1_comment, {})
    end
end
