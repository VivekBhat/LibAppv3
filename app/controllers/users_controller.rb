class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
  end
  def edit
  @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    user_params[:ornot] = 0
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_path(@user), notice: 'User was added successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Updated your profile successfully.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :password_digest)
  end

end
