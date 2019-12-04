class ArticlesController < ApplicationController
  
  get '/articles' do 
    @articles = Article.all
  erb :index 
end
  
  
  
  
  #great starting point because its the easist to test
  get '/articles/new' do 
   erb :new
  end
  
  post '/articles' do
  article = Article.new(article_params)
  
  if article.save
redirect "/articles/#{article.id}"
else 
  puts " oooh noo"
  redirect '/'
end
end 

get '/articles/:id' do 
  set_article
 # @article = Article.find_by(id: params[:id])
  erb :show
# if @article
#   erb :show
#   else 
#   puts " oooh noo"
#   redirect '/'
#set_article handles error handling commented out above
  
end
# end 

get '/articles/:id/edit' do 
  set_article
  # @article = Article.find_by(id: params[:id])
   erb :edit
end

patch '/articles/:id' do
  set_article
#   @article = Article.find_by(id: params[:id])
 if @article.update(article_params)
     redirect "/articles/#{articles.id}"
   else 
     puts "could not update"
    redirect '/articles'
  end
 end
 
 delete '/articles/:id' do
   set_article 
   @article.destroy
   redirect '/articles'
  end

private
def article_params
  { title: params[:title], content: params[:content] }
end

def set_article
   @article = Article.find_by(id: params[:id])
   unless @article
   puts "#{params[:id]} is not a valid article"
   redirects '/'
end
end
end


