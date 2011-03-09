class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def new
  end
  
  def create
    first_name = params[:user][:fname]
    last_name = params[:user][:lname]
    username = params[:user][:uname]
    password = params[:user][:pword]
    division = params[:user][:div]
    department = params[:user][:dep]
    conn = ActiveRecord::Base.connection
    sql = "insert into users_view (first_name,last_name,username,password," +
          "division,department) values ('" + first_name + "','" + last_name + 
          "','" + username + "','" + password + "','" + division + "','" + 
          department + "')"
    conn.insert(sql)
    redirect_to :controller => "users", :action => "index"
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def chooseUser
    @users = User.all
  end 
  def update
    @user = User.find(params[:user][:id])
    if @user.update_attributes(:first_name => params[:user][:first_name], 
      :last_name => params[:user][:last_name], :username => params[:user][:username], 
      :division => params[:user][:division], :department => params[:user][:department])
      redirect_to :controller => "users", :action => "index"
    else
      render :action => "edit"
    end
  end
  
  def resetPass
  #  success = params[:success]
  #  if success
  #    @notice = "Successfully reset password"
  #  else 
  #    @notice = "Reset a users password"
  #  end     
  end
  
  def updatePass
    username = params[:logininfo][:username]
    password = params[:logininfo][:password]
    conn = ActiveRecord::Base.connection
    result = conn.select_value("select resetPass('" + username + "','" + password + "')")
    if result == "t"
      cookies.signed[:resetPassSuccess] = true
      #redirect_to :controller => "users", :action => "resetPass", :success => true
    elsif result == "f"
      cookies.signed[:resetPassSuccess] = false
      #redirect_to :controller => "users", :action => "resetPass", :success => false
    end
    redirect_to :controller => "users", :action => "resetPassResult"
  end
  
  def resetPassResult
    if cookies.signed[:resetPassSuccess] = true
      @result = "Password has been changed"
    elsif cookies.signed[:resetPassSuccess] = false
      @result = "Failed to change password"
    end
  end

end
