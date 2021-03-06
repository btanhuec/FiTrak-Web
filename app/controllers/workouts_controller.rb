class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy]
  attr_reader :firebase
  # GET /workouts
  # GET /workouts.json
  def index
    @workouts = Workout.all
  end
  def client_page

  end
  # GET /workouts/1
  # GET /workouts/1.json
  def show
  end

  # GET /workouts/new
  def new

    @workout = Workout.new
    @workout.user_id = current_user.id
  end

  # GET /workouts/1/edit
  def edit
  end

  # POST /workouts
  # POST /workouts.json
  def create

    @workout = Workout.new(workout_params)
    @workout.user_id = current_user.id
    @username = current_user.email.split("@").first
    firebase = Firebase::Client.new('https://fitrak-a97c2.firebaseio.com/WORKOUTS')
    respond_to do |format|
      if @workout.save
        format.html { redirect_to @workout, notice: 'Workout was successfully created.' }
        format.json { render :show, status: :created, location: @workout }
        @response = firebase.set(@workout.name, {:username => @username, :name => @workout.name, :description => @workout.description, :user_id => @workout.user_id})
      else
        format.html { render :new }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workouts/1
  # PATCH/PUT /workouts/1.json
  def update
    respond_to do |format|
      if @workout.update(workout_params)
        format.html { redirect_to @workout, notice: 'Workout was successfully updated.' }
        format.json { render :show, status: :ok, location: @workout }
      else
        format.html { render :edit }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workouts/1
  # DELETE /workouts/1.json
  def destroy
    @workout.destroy
    respond_to do |format|
      format.html { redirect_to workouts_url, notice: 'Workout was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def assign_to_client
    # @workout= Workout.find(passed)
    @cur_workout = Workout.find(params[:item_id])

    firebase = Firebase::Client.new('https://fitrak-a97c2.firebaseio.com/WORKOUTS/' + @cur_workout.name)
    @response = firebase.push(:client_names, params[:this_client])

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout
      @workout = Workout.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workout_params
      params.require(:workout).permit(:name, :description, :user_id)
    end
end
