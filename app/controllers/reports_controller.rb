class ReportsController < ApplicationController
  # before_filter :signed_in_user
  skip_before_filter :verify_authenticity_token, :only => [:mcreate]
  
  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reports }
    end
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    @report = Report.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @report }
    end
  end

  # GET /reports/new
  # GET /reports/new.json
  def new
    @report = Report.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @report }
    end
  end

  # GET /reports/1/edit
  def edit
    @report = Report.find(params[:id])
  end

  # POST /reports
  # POST /reports.json
  def create
    params[:timestamp] = DateTime.new(1970, 1, 1) + (params[:timestamp].to_i/1000).seconds
    @report = Report.new(params)
    Logging.create(when: (DateTime.now), user_id: current_user, event: "Report Double Parked Car")
    @report.user = current_user

    respond_to do |format|
      if @report.save
        puts "should have saved"
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        # This is where string identifier is sent back
        format.json { render json: @report }
      else
        puts "should not have saved"
        format.html { render action: "new" }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /reports/mobile_create
  # POST /reports/mobile_create.json
  def mcreate
    user = User.find_by_remember_token(params[:remember_token])
    puts "#{params}"
     
    if user #&& user.activation
      params[:timestamp] = DateTime.new(1970, 1, 1) + (params[:timestamp].to_i/1000).seconds
      @report = Report.new(params[:report])
      @report.user_id = user.id

      
      
      Logging.create(when: (DateTime.now), user_id: current_user, event: "Report Double Parked Car")
      
      respond_to do |format|
        if @report.save

          #figure out message to send back to mobile through helper method
          response= msg(@report)
          puts "**************************** #{response}"
          
          puts "should have saved"
          format.html { redirect_to @report, notice: 'Report was successfully created.' }
          # This is where string identifier is sent back
            format.json { render json: { response:response } }
        else
          puts "should not have saved"
          format.html { render action: "new" }
          format.json { render json: @report.errors, status: :unprocessable_entity }
        end
      end
    else
      puts "***********No user with given token"
    end
  end

  # PUT /reports/1
  # PUT /reports/1.json
  def update
    @report = Report.find(params[:id])

    respond_to do |format|
      if @report.update_attributes(params[:report])
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report = Report.find(params[:id])
    @report.destroy

    respond_to do |format|
      format.html { redirect_to reports_url }
      format.json { head :no_content }
    end
  end
end
