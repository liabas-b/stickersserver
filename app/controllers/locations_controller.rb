
class LocationsController < ApplicationController
  include ApplicationHelper
  
  before_filter :has_rights, :column_names
  helper_method :sort_column, :sort_direction

  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.search(params[:search], params["column"]).reorder(sort_column + " " + sort_direction)
    @locations = @locations.paginate(per_page: 10, :page => params[:page]) unless params[:paginate] == 'false'

    respond_to do |format|
      format.html # index.html.erb
      format.json {
        if (params[:last] == 'true')
          render :json => Location.search(params[:search], "sticker_code").last
        else
          render json: @locations
        end
      }
      format.js
    end
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    @location = Location.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @location }
    end
  end

  # GET /locations/new
  # GET /locations/new.json
  def new
    @location = Location.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @location }
    end
  end

  # GET /locations/1/edit
  def edit
    @location = Location.find(params[:id])
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(params[:location])

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render json: @location, status: :created, location: @location }
      else
        format.html { render action: "new" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /locations/1
  # PUT /locations/1.json
  def update
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to locations_url }
      format.json { render :json => true }
    end
  end

  def last_location
    locations = Location.where("locations.sticker_code='" + params[:sticker_code] + "'")
    if !locations.nil? and locations.count > 0
      puts locations.first.inspect
      render :json => locations.last
    else
      render :json => nil, status: :bad_request
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
