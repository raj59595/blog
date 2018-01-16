class TagsController < ApplicationController
	def index
    	@tags = Tag.all
  	end
	
	def show
    	@tag = Tag.find(params[:id])
  	end
  
	def new
		@tag = Tag.new
	end

	def edit
			@tag = Tag.find(params[:id])
	end

	def create 
		@tag = Tag.new(tag_params)
 
  		if @tag.save
    	redirect_to @tag
  		else
    	render 'new'
  	end
end
	def update
  	@tag = Tag.find(params[:id])
 
  if @tag.update(tag_params)
    redirect_to @tag
  else
    render 'edit'
  end
 end

def destroy
    @article = Article.find(params[:article_id])
    @tag = @article.tags.find(params[:tag_id])
    @tag.destroy
    redirect_to article_path(@article)
  end



  private
  	def tag_params
  	 params.require(:tag).permit(:title)
  	end
 end

