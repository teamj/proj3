class UserSuggestionsController < ApplicationController
  def index
    @usersuggestions = UserSuggestion.all
  end
  def divChairView
    @usersuggestions = UserSuggestion.find_all_by_division(params[:div])
  end
  def depView
    @usersuggestions = UserSuggestion.find_all_by_department(params[:dep])
  end
  def new_user
    @usersuggestions = UserSuggestion.new
  end
end
