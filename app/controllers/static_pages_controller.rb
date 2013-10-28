
class StaticPagesController < ApplicationController
	include ApplicationHelper
	
	before_filter :has_rights, :column_names
	helper_method :sort_column, :sort_direction

	def home
		@locations = Location.search(params[:search], params["column"]).reorder(sort_column + " " + sort_direction).paginate(per_page: 10, :page => params[:page])

    respond_to do |format|
      format.html # home.html.erb
      format.js # home.js.erb
      format.json { render :json => @locations }
    end
	end

    
  def web_sockets
  end

	private

    def sort_column
      Location.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end

    def column_names
    	@column_names = Location.column_names
    end
end
