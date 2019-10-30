class UsersController < ApplicationController
	before_action :authenticate_user!
	

  def new
  end

def index
	@users = User.all
	@user = current_user
	@book = Book.new

end

def show
	@book = Book.new
  	@books = Book.all
  	@user = User.find(params[:id])
end

def edit
	# ログインしているユーザーの情報をとってくる
	@user = User.find(params[:id])
	 if current_user.id != @user.id
		redirect_to user_path(current_user)
	end
 end
	# edit画面
	# <%= form_for(ログインしているユーザー情報) do |f| %>
	# 	f.name
	# 	f.intro

	# 	f.submit



def  update
    @user = User.find(params[:id])
   if  @user.update(user_params)
    flash[:notice] = 'successfully'
    redirect_to user_path(@user.id)
    else
    	render 'edit'
    end

 end

    private

	def user_params
	    params.require(:user).permit(:name, :profile_image, :introduction)
	end

end


