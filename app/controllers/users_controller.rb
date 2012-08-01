class UsersController < ApplicationController
  before_filter :signed_in_user, :except => [:mcreate, :activate]
  skip_before_filter :verify_authenticity_token, :only => :mcreate

  def activate 
    puts "************** #{params.inspect}"
    @user = User.find_by_remember_token(params[:remember_token])
    puts "************** #{@user.inspect}"
    @user.activation = true
  end 

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @user_reports = @user.reports

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user], :as => :admin_user)
    Logging.create(when: (DateTime.now), user_id: current_user, event: "Requesting new Account" )

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /users/mcreate
  # POST /users/mcreate.json
  def mcreate
    puts "******************* #{params.inspect}"
    email = params[:email]
    if user.find_by_email(email)
      respond_to do |format|
        format.json { render json: { reponse: "Email already taken!" }
      end
    end
    else
      pw = SecureRandom.urlsafe_base64
      @user = User.new(email: email, password: pw, password_confirmation: pw)
      Logging.create(when: (DateTime.now), user_id: current_user, event: "Requesting new Account" )

      respond_to do |format|
        if @user.save
          # Tell the UserMailer to send a welcome Email after save
          UserMailer.activation_email(@user).deliver
          format.json { render json: {token: @user.remember_token, NumReports: Setting.find(1).value}, status: :created, response: "Account successfully created!" }
        else
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user], :as => :admin_user)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path

    respond_to do |format|
      format.html { redirect_to users_path }
      format.json { head :no_content }
    end
  end


  def updates
    @reports = Report.all
    puts "********************** #{@reports}"
    @user = current_user
    UserMailer.updates_email(@user, @reports).deliver
  end 
end
