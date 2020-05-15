
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end
  
  get '/articles' do 
    @articles = Article.all 
    
    erb :index 
  end 
  
  get '/articles/new' do 
    erb :new 
  end 
  
  get '/articles/:id' do 
    @article = Article.find(params[:id])
    
    erb :show 
  end 
  
  post '/articles' do 
    @article = Article.create(params)
    redirect "/articles/#{@article.id}"
    
    erb :show 
  end 
  
  get '/articles/:id/edit' do 
    @article = Article.find(params[:id])
    erb :edit 
  end 
  
  patch '/articles/:id' do 
    # binding.pry 
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect "/articles/#{@article.id}"
    else
      puts "could not update"
      redirect '/articles'
    end
  end 
  
  delete '/articles/:id' do 
    @article = Article.find(params[:id]) 
    
    @article.destroy
  end 

  private
  
  def article_params 
    {title: params[:title], content: params[:content]}
  end 
  
  
  
  
end
