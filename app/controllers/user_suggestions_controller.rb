class UserSuggestionsController < ApplicationController
  def index
    @usersuggestions = UserSuggestion.all
  end
  def divChairView
    division = cookies.signed[:user_div]
    @usersuggestions = UserSuggestion.find_all_by_division(division)
  end
  def depView
    department = cookies.signed[:user_dep]
    @usersuggestions = UserSuggestion.find_all_by_department(department)
  end
  def create
    suggestion = params[:user_suggestion][:suggestion]
    id = params[:user_suggestion][:id]
    conn = ActiveRecord::Base.connection
    sql = "insert into user_suggestion_view (userid,suggestion) values ('" + id +
      "','" + suggestion + "')"
    conn.insert(sql)
    
    redirect_to :controller => "user_suggestions", :action => "index"
    
  end
end
