class LoggingsController < ApplicationController
  # GET /loggings
  # GET /loggings.json
  def index
    @loggings = Logging.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @loggings }
    end
  end

  # GET /loggings/1
  # GET /loggings/1.json
  def show
    @logging = Logging.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @logging }
    end
  end

  # GET /loggings/new
  # GET /loggings/new.json
  def new
    @logging = Logging.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @logging }
    end
  end

  # GET /loggings/1/edit
  def edit
    @logging = Logging.find(params[:id])
  end

  # POST /loggings
  # POST /loggings.json
  def create
    @logging = Logging.new(params[:logging])

    respond_to do |format|
      if @logging.save
        format.html { redirect_to @logging, notice: 'Logging was successfully created.' }
        format.json { render json: @logging, status: :created, location: @logging }
      else
        format.html { render action: "new" }
        format.json { render json: @logging.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /loggings/1
  # PUT /loggings/1.json
  def update
    @logging = Logging.find(params[:id])

    respond_to do |format|
      if @logging.update_attributes(params[:logging])
        format.html { redirect_to @logging, notice: 'Logging was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @logging.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loggings/1
  # DELETE /loggings/1.json
  def destroy
    @logging = Logging.find(params[:id])
    @logging.destroy

    respond_to do |format|
      format.html { redirect_to loggings_url }
      format.json { head :no_content }
    end
  end
end
