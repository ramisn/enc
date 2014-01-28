class UsersController < ApplicationController
  before_filter :authenticate_user!

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /candidates
  # GET /candidates.json
  def index
    @users = User.all
  end

  # GET /candidates/1
  # GET /candidates/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /candidates/new
  def new
    @user = User.new
  end

  # GET /candidates/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /candidates
  # POST /candidates.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candidates/1
  # PATCH/PUT /candidates/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidates/1
  # DELETE /candidates/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  # def search
  #   if params[:search].blank?
  #     @users = User.all
  #   else
  #     #@events = Event.search(params[:event][:search])
  #     #@events = Event.where(params[:event][:search])
  #     @users = User.where(["sex=?", params[:search]])
  #   end
  #   render :layout => false
  # end

  def search

    if params[:user][:search].blank?
      @users = User.all
    else
      @users = User.search(params[:user][:search])
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :last_name, :sex, :dob, :middle_initial, :social_security, :verify_social_security, :website, :address, :address1, :city, :state, :zip, :home_phone, :work_phone, :ext, :mobile, :fax, :available)
    end
end


