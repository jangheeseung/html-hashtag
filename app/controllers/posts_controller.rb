class PostsController < ApplicationController
  def index
    @posts=Post.all.reverse
  end

  def create
     @post=Post.new
     @post.title=params[:post_title]
     @post.content=params[:post_content]
     
    hashtags=params[:hashtags].split(',')
    
      hashtags.each do |tag|
      hashtag=Hashtag.find_or_create_by(name: tag)
      hashtag.save
       @post.hashtags << hashtag
   
    end
    
    @post.save
    
    redirect_to '/' 
  end
  
  def edit
    @post = Post.find(params[:post_id])
  end
  
  def update
    @post=Post.find(params[:post_id])
     @post.title=params[:post_title]
    @post.content=params[:post_content]
    @post.hashtags.clear
    
    hashtags=params[:hashtags].split(',')
    hashtags.each do |tag|
      hashtag=Hashtag.find_or_create_by(name: tag)
      hashtag.save
      @post.hashtags << hashtag
   
    end
    
    @post.save
    redirect_to '/posts/index'
   end 

  def delete
    temp_post=Post.find(params[:post_id])
    temp_post.destroy
    
    redirect_to '/'
  end
  
end
