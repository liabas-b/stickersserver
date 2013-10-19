class StickerConfigurationsController < ApplicationController
  include ApplicationHelper
  
  before_filter :has_rights, :column_names
  helper_method :sort_column, :sort_direction

  # GET /sticker_configurations
  # GET /sticker_configurations.json
  def index
    @sticker_configurations = StickerConfiguration.search(params[:search], params["column"]).reorder(sort_column + " " + sort_direction)
    @sticker_configurations = @sticker_configurations.paginate(per_page: 10, :page => params[:page]) unless params[:paginate] == 'false'
    @column_names = StickerConfiguration.column_names

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sticker_configurations }
      format.js
    end
  end

  # GET /sticker_configurations/1
  # GET /sticker_configurations/1.json
  def show
    @sticker_configuration = StickerConfiguration.where(' sticker_code="' + params[:id] + '" OR id="' + params[:id]).first

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sticker_configuration }
    end
  end

  # GET /sticker_configurations/new
  # GET /sticker_configurations/new.json
  def new
    @sticker_configuration = StickerConfiguration.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sticker_configuration }
    end
  end

  # GET /sticker_configurations/1/edit
  def edit
    @sticker_configuration = StickerConfiguration.find(params[:id])
  end

  # POST /sticker_configurations
  # POST /sticker_configurations.json
  def create
    @sticker_configuration = StickerConfiguration.new(params[:sticker_configuration])

    respond_to do |format|
      if @sticker_configuration.save
        format.html { redirect_to @sticker_configuration, notice: 'Sticker configuration was successfully created.' }
        format.json { render json: @sticker_configuration, status: :created, location: @sticker_configuration }
      else
        format.html { render action: "new" }
        format.json { render json: @sticker_configuration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sticker_configurations/1
  # PUT /sticker_configurations/1.json
  def update
    @sticker_configuration = StickerConfiguration.find(params[:id])

    respond_to do |format|
      if @sticker_configuration.update_attributes(params[:sticker_configuration])
        format.html { redirect_to @sticker_configuration, notice: 'Sticker configuration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sticker_configuration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sticker_configurations/1
  # DELETE /sticker_configurations/1.json
  def destroy
    @sticker_configuration = StickerConfiguration.find(params[:id])
    @sticker_configuration.destroy

    respond_to do |format|
      format.html { redirect_to sticker_configurations_url }
      format.json { head :no_content }
    end
  end

  private

    def sort_column
      StickerConfiguration.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end

    def column_names
      @column_names = StickerConfiguration.column_names
    end
end
