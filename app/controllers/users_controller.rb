class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.image_name = "default_user.jpg"
    @user.introduction = "未設定"
    @user.user_id =@user.id
      if @user.save
        flash[:notice]="アカウントを作成しました"
        redirect_to("/")
      else
        flash[:notice]="入力内容にエラーがあります"
        render "new"
      end
  end

  def login_form
  end

  def login
    @user = User.find_by(
      email: params[:email],
      password_digest: params[:password_digest]
    )
    if @user
    flash[:notice]="ログインしました"
    redirect_to("/")
    session[:user_id] = @user.id
     else
      flash[:notice]="入力内容にエラーがあります"
      render "login_form"
     end
  end

  def logout
    session[:user_id] = nil
    flash[:notice]="ログアウトしました"
    redirect_to("/")
  end

  def show
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.introduction = params[:introduction]
    
    if params[:image]
      image = params[:image]
      @user.image_name = "#{@user.id}.jpg"
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end
    
    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to :edit_user
    else
      render("users/edit")
    end
  end

  def destroy
  end

  def reserve
  end

  private
def user_params
  params.require(:user).permit(:name, :email, :password_digest,:image_name,:introduction,:user_id)
end

end
