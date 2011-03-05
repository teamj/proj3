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
    user = conn.select_one("select * from users where id=" + user_id.to_s + "")
    #division = conn.select_value("select division from users where id = " + user_id.to_s)
    if username == password && username == "guest"
      #cookies.signed[:user_id] = -1
      cookies.signed[:authenticated] = false
      redirect_to :controller => "user_suggestions", :action => "index"
    elsif user_id > 0
      cookies.signed[:user_id] = user_id
      cookies.signed[:user_div] = user['division']
      cookies.signed[:user_dep] = user['department']
      cookies.signed[:user_fname] = user['first_name']
      cookies.signed[:user_lname] = user['last_name']
      cookies.signed[:authenticated] = true
      #if cookies.signed[:user_div] == "admin" && cookies.signed[:user_dep] == "admin"
      #  cookies.signed[:admin] = true
      #elsif cookies.signed[:user_div] == cookies.signed[:user_dep]
      #  cookies.signed[:divChair] = true
      #end
      redirect_to :controller => "pages", :action => "continue"
    #elsif division == "admin"
    #  redirect_to :controller => "pages", :action => "continue"
    #elsif user['division'] == "admin" && user['department'] == "admin"
    #  redirect_to :controller => "pages", :action => "continue"
    end
  end

  def logout
  end

end
