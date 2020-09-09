class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show, :new, :create]

    def new
        @post = Post.new
    end

    def index
        #@posts = Posts.all.order("created_at DESC")
        @post = Post.new
    end

    def create
        @post.user_id = current_user.id
        @post = current_user.posts.build(post_params)

        respond_to do |format|
          if @tweeet.save
            format.html { redirect_to root_path, notice: 'Post was successfully created.' }
            format.json { render :show, status: :created, location: @post }
          else
            format.html { render :new }
            format.json { render json: @post.errors, status: :unprocessable_entity }
          end
        end
    end

    def index
    
    end

    private 

    def tweeet_params
        params.require(:post).permit(:title, :body, :user_id)
    end
end
