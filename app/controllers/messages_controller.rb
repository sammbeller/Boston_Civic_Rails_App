class MessagesController < ApplicationController
  before_filter :signed_in_user, except: [:index, :heat, :mobile]

  # GET /messages
  # GET /messages.json
  def index
    if Setting.all.empty?
      how_many = 10
    else 
      how_many = Setting.find_by_name("HomepageView").value.to_int
    end
    
    #Display Reports based on params
    if (params.has_key?(:span) && params.has_key?(:day) && params.has_key?(:time))
      @Reports = Report.find_by_options(DateTime.parse(params[:span]), JSON.parse(params[:day]), JSON.parse(params[:time]))
    else
      @Reports = Report.all
    end
    @messages = Message.limit(how_many).order('created_at DESC')

    # @messages = Message.find_by_created_at(xxxx)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

    # GET /messages/mobile_view.json
  def mobile
    @messages = Message.find(:all, limit: Setting.find_by_name("MessLimit").value)
    render json: @messages
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.json
  def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(params[:message])

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render action: "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.json
  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end

  def heat
    if (params.has_key?(:span) && params.has_key?(:day) && params.has_key?(:time))
      @Reports = Report.find_by_options(DateTime.parse(params[:span]), JSON.parse(params[:day]), JSON.parse(params[:time]))
    else
      @Reports = Report.all
    end
  end 

  def updates 
    @messages = Message.order('created_at DESC')
  end 
end
