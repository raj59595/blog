class MyTopicsController < ApplicationController
def create
    @article = Article.find(params[:article_id])
    @my_topic = @article.my_topics.create(my_topic_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @my_topic = @article.my_topics.find(params[:id])
    @my_topic.destroy
    redirect_to article_path(@article)
  end
 
  private
    def my_topic_params
      params.require(:my_topic).permit(:name)
    end
end
