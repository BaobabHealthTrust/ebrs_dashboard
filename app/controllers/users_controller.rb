class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index

    redirect_to "/" and return if !((User.current_user.role.strip.downcase.match(/admin/) rescue false) ? true : false)

    @icoFolder = "data:image/png;base64,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"

    @section = "User Management"

    @targeturl = "/"

    @targettext = "Cancel"

    render :layout => "facility"

  end

  # GET /users/1
  # GET /users/1.json
  def show

    @section = "View User"

    @targeturl = "/view_users"

    render :layout => "facility"

  end

  # GET /users/new
  def new

    redirect_to "/" and return if !((User.current_user.role.strip.downcase.match(/admin/) rescue false) ? true : false)

    @user = User.new

    @section = "Create User"

    @targeturl = "/view_users"

    render :layout => "touch"

  end

  # GET /users/1/edit
  def edit

    redirect_to "/" and return if !((User.current_user.role.strip.downcase.match(/admin/) rescue false) ? true : false)

    @section = "Edit User"

    @targeturl = "/view_users"

    render :layout => "facility"

  end

  # POST /users
  # POST /users.json
  def create

    redirect_to "/" and return if !((User.current_user.role.strip.downcase.match(/admin/) rescue false) ? true : false)

    filtered = {}

    filtered = user_params.dup

    filtered.delete("_rev")

    @user = User.new(filtered)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if ((User.current_user.role.strip.downcase.match(/admin/) rescue false) ? true : false) and @user.update_attributes(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy

    redirect_to "/" and return if !((User.current_user.role.strip.downcase.match(/admin/) rescue false) ? true : false)

    @user.destroy if ((User.current_user.role.strip.downcase.match(/admin/) rescue false) ? true : false)
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def block

    redirect_to "/" and return if !((User.current_user.role.strip.downcase.match(/admin/) rescue false) ? true : false)

    @users = User.all.each

    @section = "Block User"

    @targeturl = "/users"

    render :layout => "facility"

  end

  def unblock

    redirect_to "/" and return if !((User.current_user.role.strip.downcase.match(/admin/) rescue false) ? true : false)

    @users = User.all.each

    @section = "Unblock User"

    @targeturl = "/users"

    render :layout => "facility"

  end

  def block_user

    redirect_to "/" and return if !((User.current_user.role.strip.downcase.match(/admin/) rescue false) ? true : false)

    user = User.find(params[:id]) rescue nil

    if !user.nil?

      user.update_attributes(:active => false, :un_or_block_reason => params[:reason]) if ((User.current_user.role.strip.downcase.match(/admin/) rescue false) ? true : false)

    end

    redirect_to "/view_users" and return

  end

  def unblock_user

    redirect_to "/" and return if !((User.current_user.role.strip.downcase.match(/admin/) rescue false) ? true : false)

    user = User.find(params[:id]) rescue nil

    if !user.nil?

      user.update_attributes(:active => true, :un_or_block_reason => params[:reason]) if ((User.current_user.role.strip.downcase.match(/admin/) rescue false) ? true : false)

    end

    redirect_to "/view_users" and return

  end

  def view

    redirect_to "/" and return if !((User.current_user.role.strip.downcase.match(/admin/) rescue false) ? true : false)

    @users = User.all.each

    @section = "View Users"

    @targeturl = "/users"

    render :layout => "facility"

  end

  def query

    redirect_to "/" and return if !((User.current_user.role.strip.downcase.match(/admin/) rescue false) ? true : false)

    results = []

    users = User.all.page((params[:page].to_i rescue 1)).per((params[:size].to_i rescue 20)).each

    users.each do |user|

      record = {
          "username" => "#{user.username}",
          "name" => "#{user.first_name} #{user.last_name}",
          "roles" => "#{user.role}",
          "active" => (user.active rescue false)
      }

      results << record

    end

    render :text => results.to_json

  end

  def search

    redirect_to "/" and return if !((User.current_user.role.strip.downcase.match(/admin/) rescue false) ? true : false)

    @section = "Search for User"

    @targeturl = "/users"

    render :layout => "facility"

  end

  def search_by_username

    redirect_to "/" and return if !((User.current_user.role.strip.downcase.match(/admin/) rescue false) ? true : false)

    name = params[:id].strip rescue ""

    results = []

    if name.length > 1

      users = User.by_username.key(name).limit(10).each

    else

      users = User.by_username.limit(10).each

    end

    users.each do |user|

      next if user.username.strip.downcase == User.current_user.username.strip.downcase

      record = {
          "username" => "#{user.username}",
          "fname" => "#{user.first_name}",
          "lname" => "#{user.last_name}",
          "role" => "#{user.role}",
          "active" => (user.active rescue false)
      }

      results << record

    end

    render :text => results.to_json

  end

  def username_availability
    user = User.get_active_user(params[:search_str])
    render :text => user = user.blank? ? 'OK' : 'N/A' and return
  end

  def my_account

    @section = "My Account"

    @targeturl = "/"

    @user = User.current_user

    render :layout => "facility"

  end

  def change_password

    @section = "Change Password"

    @targeturl = "/"

    @user = User.current_user

    render :layout => "facility"

  end

  def update_password

    user = User.current_user

    result = user.password_matches?(params[:old_password])

    if user and user.password_matches?(params[:old_password])

      user.update_attributes(:plain_password => params[:new_password])

    end

    render :text => result

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :active, :create_at, :creator, :email, :first_name, :last_name, :notify, :plain_password, :role, :updated_at, :_rev)
    end
end
