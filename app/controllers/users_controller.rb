class UsersController < ApplicationController
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
            "division,department) values ('" + first_name + "','" + last_name + "','" + username +
            "','" + password + "','" + division + "','" + department + "')"
    conn.insert(sql)
    redirect_to :controller => "users", :action => "index"
  end

  def edit
  end

  def index
    @users = User.all
  end

end
