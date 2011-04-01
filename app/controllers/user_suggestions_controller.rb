class UserSuggestionsController < ApplicationController
  def index
    sortBy = params[:sortBy]
    if sortBy == "division"
      @usersuggestions = UserSuggestion.order("division ASC")
    elsif sortBy == "department"
      @usersuggestions = UserSuggestion.order("department ASC")
    elsif sortBy == "name"
      @usersuggestions = UserSuggestion.order("last_name ASC")
    elsif sortBy == "mod"
      @usersuggestions = UserSuggestion.order("updated_at ASC")
    else
      @usersuggestions = UserSuggestion.all
      respond_to do |format|
        format.html
        format.xml {render :xml => @usersuggestions, :dasherize => false}
      end
    end
  end
  
  #def suggestion # TEST FOR FLEX
  #  @usersuggestions = UserSuggestion.all
  #  respond_to do |format|
  #    format.html
  #    format.xml {render :xml => @usersuggestions, :dasherize => false}
  #  end
  #end
  
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
    suggestion = suggestion.gsub(/'/,"''")
    id = cookies.signed[:user_id]
    conn = ActiveRecord::Base.connection
    sql = "insert into user_suggestion_view (userid,suggestion) values (" + id.to_s +
      ",'" + suggestion + "')"
    conn.insert(sql)
    redirect_to :controller => "user_suggestions", :action => "index"
    
  end
  
  def chooseSuggestion
    id = cookies.signed[:user_id]
    division = cookies.signed[:user_div]
    if cookies.signed[:divChair]  
      @usersuggestions = UserSuggestion.find_all_by_division(division)
    
    else
      @usersuggestions = UserSuggestion.find_all_by_userid(id)
    end
  end
  
  def edit
    @usersuggestion = UserSuggestion.find_by_suggestionid(params[:id])
  end
  
  def chooseSurveySugg
    id = cookies.signed[:user_id]
    division = cookies.signed[:user_div]
    if cookies.signed[:divChair]  
      @usersuggestions = UserSuggestion.find_all_by_division(division)
    end
  end
  
  def survey
    @suggestion = UserSuggestion.find_by_suggestionid(params[:id])
  end
end
