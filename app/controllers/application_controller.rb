
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    redirect "/articles"
  end

    # CREATE / NEW
    get "/articles/new" do
      erb :new
    end
  
    post "/articles" do
      @article = Article.create(params)
      redirect "/articles/#{@article.id}"
    end

  # READ
  # Read All Articles
  get '/articles' do
    @article = Article.all
    erb :index
  end

  # Read Specific Article
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  # UPDATE
  get "/articles/:id/edit" do 
    @article = Article.find(params[:id])
    erb :edit
  end

  patch "/articles/:id" do
    @article = Article.find(params[:id])
    
    if @article.update(title: params[:title], content: params[:content])
      redirect "/articles/#{@article.id}"
    else
      puts "could not update"
      redirect '/articles'
    end
  end

  # DELETE
  # delete "/articles/all" do
  #   @article = Article.all
  #   @article.destroy_all
  #   redirect "/articles"
  # end

  delete "/articles/:id" do
    @article = Article.find(params[:id])
    @article.destroy
    redirect "/articles"
  end

  
end
