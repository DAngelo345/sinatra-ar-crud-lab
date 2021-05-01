require 'pry'
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
    # binding.pry
    @article = Article.new
    
    
    erb :new
    
  end
  
  get '/articles/:id' do 
    @article = Article.find(params[:id])
    # binding.pry

    erb :show
  end

  post '/articles' do 
    # binding.pry
    @article = Article.create(params)

    redirect "/articles/#{@article.id}"
  end

  get '/articles/:id/edit' do 

    @article = Article.find(params[:id])
    # binding.pry

    
    erb :edit
  end

  patch '/articles/:id' do 
    article = Article.find_by(id: params[:id])
    attrs = params[:title]
    article.update(params[:article])
    # binding.pry
    # article.save

    # binding.pry

    redirect "/articles/#{article.id}"
  end

  delete '/articles/:id' do 
    id = params[:id]
    # article = Article.find_by(id: id)
    Article.destroy(id)
    # binding.pry


  end

  

end
