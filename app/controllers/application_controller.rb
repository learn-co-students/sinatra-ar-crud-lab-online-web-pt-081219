
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/articles"
  end

  # index
  get "/articles" do
    @articles = Article.all
    erb :index
  end



  get "/articles/new" do #make sure this is above show!!!
    # @article = Article.new
    erb :new
  end

  # create
  post "/articles" do
    @article = Article.create(params)
    redirect to "/articles/#{ @article.id }"
  end

  # show 
  get "/articles/:id" do
    @article = Article.find(params[:id])
    erb :show
  end

  get "/articles/:id/edit" do #goes after show
    #check your config.ru and make sure "use Rack::MethodOverride" is there
    @article = Article.find(params[:id]) #need to know what to edit
    erb :edit
  end

  patch "/articles/:id" do
    @article = Article.find(params[:id]) #find article
    @article.update(params[:article]) #update article with new params
    redirect to "/articles/#{ @article.id }" #redirect to show page
  end

  delete "/articles/:id" do
    # Article.destroy(params[:id])
    @article = Article.find(params[:id]) #find article
    @article.destroy #destroy article
    redirect to :index #redirect to index
  end

  

  
end

# require_relative '../../config/environment'

# class ApplicationController < Sinatra::Base

#   configure do
#     set :public_folder, 'public'
#     set :views, 'app/views'
#   end

#   get '/' do
#   end	  

#   get '/articles/new' do
#     erb :new
#   end

#   post '/articles' do
#     @article = Article.create(title: params[:title], content: params[:content])
#     redirect "/articles/#{@article.id}"
#   end

#   get '/articles' do
#     @articles = Article.all
#     erb :index
#   end

#   get '/articles/:id' do
#     @article = Article.find(params[:id])
#     erb :show
#   end

#   get '/articles/:id/edit' do
#     @article = Article.find(params[:id])
    
#     erb :edit
#   end

#   patch '/articles/:id' do
#     @article = Article.find(params[:id])
#     @article.title = params[:title]
#     @article.content = params[:content]
#     @article.save

#     redirect "articles/#{@article.id}"
#   end

#   delete '/articles/:id' do
#     @article = Article.find(params[:id])
#     @article.destroy

#     redirect '/articles'
#   end


end


