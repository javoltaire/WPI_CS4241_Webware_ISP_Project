class UsersController < ApplicationController


# Will get the page needed to create a new user
  def new
  	@user = User.new
  end

# Will create a new user with the data passed in and try to save it to the database
  def create
  	@user = User.new(user_params)
  	if(@user.save)
			log_in @user
		  redirect_to notes_path
  	else
  		render 'new'
  	end
  end











  

  def edit
	  @user = current_user
  end

  def update
	  @user = current_user
  end

  #   Will show the info of the user with the corresponding id
  def show
    @user = User.find(params[:id])
  end

  private

  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  	end

end
