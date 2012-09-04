#users_contoller.rb

#Available Actions:
#   users#activate : changes the given user's activation value to true
#   users#index : lists all users
#   users#show : displays given user
#   users#new : displays form for creation of a new user from the website
#   users#edit :  displays form for editing a user
#   users#create : creates a new user from params, accessible from website
#   users#mcreate : creates a new user from params, accessible from website
#   users#update : updates given user with data from params
#   users#destroy : deletes given user from db
#   users#updates : emails current user list of all reports

class UsersController < ApplicationController
  #It is assumed that the mcreate and activate actions will not be taken by signed in users
  #It is assumed that the mcreate action will be taken from mobile clients
  before_filter :signed_in_user, except: [:mcreate, :activate]
  skip_before_filter :verify_authenticity_token, only: [:mcreate]

  # GET /users/activate/:remember_token
  def activate 
    @user = User.find_by_remember_token(params[:remember_token])
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
    Logging.create( when: (DateTime.now), user_id: current_user, event: "Requesting New Account" )

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
    # Checks if the email sent is already taken
    if user.find_by_email(params[:email])
      respond_to do |format|
        format.json { render json: { reponse: "Email already taken!" } }
      end
    else
      #Generates random password
      pw = SecureRandom.urlsafe_base64
      @user = User.new(email: params[:email], password: pw, password_confirmation: pw)
      #Logs new account creation
      Logging.create(when: (DateTime.now), user_id: current_user, event: "Requesting new Account" )

      respond_to do |format|
        if @user.save
          # Tell the UserMailer to send a welcome Email after save
          UserMailer.activation_email(@user).deliver
          format.json { render json: { token: @user.remember_token, NumReports: Setting.find(1).value, response: "Account successfully created!" }, status: :created }
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
      #Allows :admin attribute to be assigned only by users for whom the attribute is true
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

  #
  def updates
    @reports = Report.all
    @user = current_user
    UserMailer.updates_email(@user, @reports).deliver
  end 
end
