class PagesController < ApplicationController
  def login
    if params[:user] == nil
      username = password = ""
    else
      username = params[:user][:username]
      password = params[:user][:password]
    end
    conn = ActiveRecord::Base.connection
    user_id = conn.select_value("select get_id('" + username + "','" + password +
              "')").to_i
    division = conn.select_value("select division from users where id = '" + user_id + "'")
    if username == password && username == "guest"
      redirect_to :controller => "user_suggestions", :action => "index"
    elsif division == "admin" 
      redirect_to :controller => "pages", :action => "continue"
    end
  end

  def logout
  end

end
