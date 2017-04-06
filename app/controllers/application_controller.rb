require_relative '../../config/environment'
require'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do

    erb :'posts/new'
  end

  post '/posts' do
    Post.create(name: params[:name], content: params[:content])
    @posts = Post.all

    erb :index
  end

  get '/posts' do
    @posts = Post.all
    # binding.pry
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  #UPDATE

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update(name: params[:name], content: params[:content])
    erb :show
  end

  #DELETE


  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.destroy
    erb :delete

    # redirect '/posts'
  end
end
