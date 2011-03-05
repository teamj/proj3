class SuggestionsController < ApplicationController
  def edit
  end

  def update
    @usersuggestion = Suggestion.find(params[:user_suggestion][:suggestionid])
    if @usersuggestion.update_attributes(:suggestion => params[:user_suggestion][:suggestion])
      redirect_to :controller => "user_suggestions", :action => "index"
    else
      render :action => "edit"
    end
  end

end
