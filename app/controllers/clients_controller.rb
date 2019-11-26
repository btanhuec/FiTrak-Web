class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /clients
  # GET /clients.json
  def index

    @clients = Client.all
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    # @firebase = Firebase::Client.new('https://fitrak-a97c2.firebaseio.com/TRAINERS')
    # @username = current_user.email.split("@").first
    # @link = @username + "/clients"
    # @response = @firebase.get(@link)
    # # @client_arr = @response.get('clients')
    # @profile.user_id = current_user.id
    # @profile.email = current_user.email

  end

  # GET /clients/new
  def new
    
      @client = Client.new
      # format.html { redirect_to @client, notice: 'Client was successfully created.' }
      # format.json { render :show, status: :created, location: @client }

  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    # c_client = Client.where(:username => params[:username])
    # if c_client.nil?
    #   redirect_to action: "index"
    # else
      
      @client = Client.new(client_params)
      respond_to do |format|
        if @client.save
          format.html { redirect_to @client, notice: 'Client was successfully created.' }
          format.json { render :show, status: :created, location: @client }
        else
          format.html { render :new }
          format.json { render json: @client.errors, status: :unprocessable_entity }
        end
      end
    # end
    
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.permit(:username, :email, :user_id)
    end
end
