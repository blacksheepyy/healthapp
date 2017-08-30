class ArticlesController < ApplicationController
    
    before_action :set_article, only: [:edit, :update, :show, :destroy]
    before_action :require_user
    before_action :require_same_user, only: [:edit, :update, :destroy]
    
    def index
        @articles = Article.order('created_at DESC').paginate(page: params[:page], per_page: 10)
    end
    
    def new
        @article = Article.new
    end
    
    def create
        @article = Article.new(article_params)
        @article.user = current_user
        
        @article.user_linemanager = current_linemanager
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
        redirect_to user_path(@article.user)
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
    
    def require_same_user
        if current_user != @article.user && !current_user.admin?
            flash[:danger] = "You can only edit or delete your own articles"
            redirect_to root_path
        end
    end
    
end