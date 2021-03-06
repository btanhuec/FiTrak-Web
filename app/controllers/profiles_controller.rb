class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  @base_uri = 'https://fitrak-a97c2.firebaseio.com/'
  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
    @profile.user_id = current_user.id
    @profile.email = current_user.email
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    @profile.email = current_user.email
    firebase = Firebase::Client.new('https://fitrak-a97c2.firebaseio.com/TRAINERS')
    @passEmail = current_user.email
    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
        @response = firebase.set(@profile.username, { :email=> @profile.email, :first_name => @profile.first_name, :last_name => @profile.last_name, :about_me => @profile.about_me, :age => @profile.age, :gender => @profile.gender, :experience => @profile.experience})
        # @response = firebase.set(@profile.user_id, { :email=> @profile.email, :first_name => @profile.first_name, :last_name => @profile.last_name, :about_me => @profile.about_me, :age => @profile.age, :gender => @profile.gender, :experience => @profile.experience})
        puts response
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    @profile = Profile.find(params[:id])
    @profile.email = current_user.email
    firebase = Firebase::Client.new('https://fitrak-a97c2.firebaseio.com/TRAINERS')
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
        firebase.update(@profile.username, {:email => @profile.email, :first_name => @profile.first_name, :last_name => @profile.last_name, :about_me => @profile.about_me, :age => @profile.age, :gender => @profile.gender, :experience => @profile.experience})
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:username, :user_id, :first_name, :last_name, :about_me, :age, :gender, :experience, :email)
    end
end
