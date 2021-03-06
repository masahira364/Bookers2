class UsersController < ApplicationController
before_action  :correct_user, only:[:edit, :update]

def index
	@users = User.all
	@user = current_user
	@book = Book.new
end

def show
	@user = User.find(params[:id])
	@book = Book.new
	@books = @user.books.page(params[:page]).reverse_order
end

def edit
	@user =User.find(params[:id])
end


def update
	@user = User.find(params[:id])
	@user.update(user_params)
	if @user.save
	redirect_to user_path(@user), notice: 'You have updated user successfully.'
else
	render :edit
end
end

def correct_user
		@user = User.find(params[:id])
		unless @user == current_user
		redirect_to user_path(current_user)
	end
    end



private
def user_params
	params.require(:user).permit(:name, :introduction, :profile_image)
end
end
