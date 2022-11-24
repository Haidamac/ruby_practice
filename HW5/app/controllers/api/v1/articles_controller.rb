class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show update destroy ]

  # GET /api/v1/articles
  def index
    @articles = Article.all

    if @articles 
      render json: { status: 'OK', data: @articles }
    else
      render json: @articles.errors, status: :bad_request
    end
  end

  # GET /api/v1/articles/1
  def show
    @article = Article.find(params[:id])
    if @article 
      render json: {data: @article}, state: :ok
    else
      render json: { message: "Not found" }, status: :bad_request
    end
  end

  # POST /api/v1/articles
  def create
    @article = Article.new(article_params)

    if @article.save 
      render json: { status: "Create", data: @article }, status: :ok
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/articles/1
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      render json: { status: "Update", data: @article }, status: :ok
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/articles/1
  def destroy
    @article = Article.find(params[:id])
    if @article.destroy! 
      render json: { status: "Delete" }, status: :ok
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
