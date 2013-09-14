class StaticPagesController < ApplicationController
	before_filter :column_names
	helper_method :sort_column, :sort_direction

	def home
		locations = Location.search(params[:search], params["column"]).reorder(sort_column + " " + sort_direction)
		@locations = WillPaginate::Collection.create(1, 10, locations.length) do |pager|
		  pager.replace locations
		end
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
