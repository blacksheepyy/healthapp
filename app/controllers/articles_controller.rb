class ArticlesController < ApplicationController
    
    before_action :set_article, only: [:edit, :update, :show, :destroy]
    
    def index
        @articles = Article.order('created_at DESC').paginate(page: params[:page], per_page: 3)
    end
    
    def new
        @article = Article.new
    end
    
    def create
        @article = Article.new(article_params)
        if @article.save
            flash[:success] = "Score has been submitted"
            redirect_to article_path(@article)
        else
            render 'new'
        end
        
    end
    
    def show
        
    end
    
    def destroy
        
        @article.destroy
        flash[:danger] = "Score has been deleted"
        redirect_to articles_path
    end
    
    def edit
        
    end
    
    def update
        
        if @article.update(article_params)
            flash[:success] = "Score was successfully submitted"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end
    
    private
    
    def set_article
        @article = Article.find(params[:id])
    end
    
    def article_params
        params.require(:article).permit(:score, :comment)
    end
end