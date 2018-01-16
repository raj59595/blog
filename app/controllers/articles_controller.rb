class ArticlesController < ApplicationController
	http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
	
	def index
    @articles = Article.all
  end
 
	def show
    @article = Article.find(params[:id])
    @tags= Tag.all
  end

	def new
  @article = Article.new
end
	def edit 
			@article = Article.find(params[:id])
    end
 
def create
  @article = Article.new(article_params)
 
  if @article.save
    redirect_to @article
  else
    render 'new'
  end

end
def update
  @article = Article.find(params[:id])
 
  if @article.update(article_params)
    redirect_to @article
  else
    render 'edit'
  end
end
def destroy
  @article = Article.find(params[:id])
  @article.destroy
 
  redirect_to articles_path
end

  def add_tag
    # article_id = 4
    article_id = params[:id]
    # tag_id = 6
    tag_id = params[:tag_id]

    @article = Article.find(article_id)
    @tag = Tag.find(tag_id)

    ArticleTag.create! tag_id: @tag.id, article_id: @article.id
    redirect_to articles_path(@article)
  end


 
private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end

